#!/usr/bin/env bash
echo "=== Olá,Bem vindo ao Chaotic-AUR Installer, (feito por um Manjaro User, e usuário de AUR kkkk) ==="
sleep 1.0
# CANCELE SE TU TÁ EM OUTRA DISTRO SEM SER ARCH-BASED PQ TU VAI RODAR ATOA
read -p "Você precisará usar o sudo ou virar su antes de rodar o Script. Deseja virar Superuser?[Y/n] " resposta
if [[ $resposta == "Y" ]] || [[ $resposta = "y" ]]; then
	echo "Pedindo Sudo... não estranhe, caso desconfie, abra o Script"
	sleep 1.0
	echo "Comando aceito! Instalando chaves... [1/4]"
	sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
	sudo pacman-key --lsign-key 3056513887B78AEB
	sleep 1.0
	echo ""
	echo "Instalando Keyring e Mirrorlist... [2/4]"
	sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
	sleep 1.0

	echo ""
	echo "Adicionando o Mirror no /etc/pacman.conf... [3/4]"
	if  grep -q "chaotic-aur" /etc/pacman.conf; then
	echo "ih meu parceiro, já tem Chaotic-aur e tu não sabia..."
else
	echo "AEEE, ainda não tem, mas vai ter agora!"
	echo "" |sudo tee -a /etc/pacman.conf > /dev/null
sudo echo "[chaotic-aur]" | sudo tee -a /etc/pacman.conf > /dev/null
sudo echo "Include = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf > /dev/null
fi
echo "Atualizando o sistema... [4/4]"
sudo pacman -Syyu

elif [[ $resposta == "N" ]] || [[ $resposta == "n" ]]; then
	echo "Beleza, Falou, Tchau meu mano!"
	exit 0
else
	echo "Flw, mano!"
	exit 0
fi
