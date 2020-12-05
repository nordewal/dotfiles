function sysu
  sudo lvs |grep lvroot_snap_ |awk '{print $1}' |xargs -i sudo lvremove -y /dev/vgroot/{} ; and \
  sudo lvcreate -L 50g -s -n lvroot_snap_(date '+%Y%m%d') /dev/vgroot/lvroot ; and \
  yay -Syu
end
