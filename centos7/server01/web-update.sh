#/bin/bash
if [ -f $1 ]; then
    unzip -o -d /root/react-demo $1
    rm -rf $1
    echo "更新完成！"
else
    echo "参数错误！"
fi