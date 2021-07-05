```shell
# 将之前的`.config`拷贝到编译环境
# docker cp config openwrt-build-env:/tmp/.config

# 进入编译环境容器
docker exec -it openwrt-build-env bash
# chown user:user /tmp/.config

# 开启代理
export https_proxy=http://172.17.0.1:7890 http_proxy=http://172.17.0.1:7890 all_proxy=socks5://172.17.0.1:7891

# clone lede
git clone https://github.com/coolsnowwolf/lede.git

# 进入仓库
cd lede

# 添加必备软件
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
sed -i '$a src-git openclash https://github.com/vernesong/OpenClash' feeds.conf.default

# 修改默认 IP
sed -i 's/192.168.1.1/192.168.1.10/g' package/base-files/files/bin/config_generate

# 修改内核为4.19
sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=4.19/g' ./target/linux/x86/Makefile
sed -i 's/KERNEL_TESTING_PATCHVER:=5.10/KERNEL_TESTING_PATCHVER:=4.19/g' ./target/linux/x86/Makefile

# 刷新feed
./scripts/feeds update -a
./scripts/feeds install -a

# cp 之前的 config
# cp /tmp/.config /home/user/lede/

# 调整编译选项
make menuconfig
# 勾选 Utilities--> acpid # 关机、重启支持

# 下载软件包，本地做测试不需要进行以下步骤
# 云编译直接下载`.config`上传即可
# make download -j8
# make -j$(($(nproc) + 1)) V=s
# cp `.config`到宿主机
docker cp openwrt-build-env:/home/user/lede/.config /root/config
```