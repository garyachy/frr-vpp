/sbin/modprobe uio_pci_generic
ip link set dev enp0s8 down
ip link set dev enp0s9 down
#./vpp/build-root/install-vpp-native/vpp/bin/vpp -c startup.conf
#gdb --args ./vpp/build-root/install-vpp_debug-native/vpp/bin/vpp -c startup.conf
/usr/bin/vpp -c startup.conf

