package com.example.aspect;

import com.example.exception.LogicException;
import com.example.result.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import static com.example.result.Result.FAILURE;

@RestControllerAdvice
@Slf4j
public class ControllerExceptionHandler {

    // controller形参校验异常
    @ExceptionHandler(ConstraintViolationException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Result HandleConstraintViolationException(ConstraintViolationException e) {
        Set<ConstraintViolation<?>> constraintViolations = e.getConstraintViolations();
        StringBuilder errorMsg = new StringBuilder();
        Iterator<ConstraintViolation<?>> iterator = constraintViolations.iterator();
        while (iterator.hasNext()) {
            ConstraintViolation violation = iterator.next();
            errorMsg.append(violation.getMessage());
            if (iterator.hasNext()) {
                errorMsg.append(",");
            }
        }
        return new Result<>(FAILURE, errorMsg.toString(), null);
    }

    // 实体类参数校验异常，MethodArgumentNotValidException为表单参数校验异常，BindException为@RequestBody参数校验异常
    @ExceptionHandler({MethodArgumentNotValidException.class, BindException.class})
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Result handleValidException(Exception e) {
        Class cls = e.getClass();
        BindingResult result = null;
        if (MethodArgumentNotValidException.class.isAssignableFrom(cls)) {
            result = ((MethodArgumentNotValidException) e).getBindingResult();
        } else if (BindException.class.isAssignableFrom(cls)) {
            result = ((BindException) e).getBindingResult();
        }
        StringBuilder errorMsg = new StringBuilder();
        if (result!=null) {
            List<ObjectError> errors = result.getAllErrors();
            Iterator<ObjectError> iterator = errors.iterator();
            while (iterator.hasNext()) {
                ObjectError error = iterator.next();
                errorMsg.append(error.getDefaultMessage());
                if (iterator.hasNext()) {
                    errorMsg.append(",");
                }
            }
        }
        return new Result<>(FAILURE, errorMsg.toString(), null);
    }

    // 业务逻辑异常
    @ExceptionHandler({LogicException.class})
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Result handleLogicException(LogicException e) {
        return new Result<>(FAILURE, e.getMessage(), null);
    }

    // 其他异常
    @ExceptionHandler({Throwable.class})
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public Result handleThrowable(Throwable e) {
        log.error(e.getMessage(), e);
        return new Result<>(FAILURE, e.getMessage(), null);
    }

}
