#!/bin/bash

# Update dan Install Paket GnuPG jika belum terpasang
echo "Memastikan gnupg terpasang..."
sudo apt-get install -y gnupg

# Unduh kunci Microsoft GPG
echo "Mengunduh kunci GPG Microsoft..."
curl https://packages.microsoft.com/keys/microsoft.asc -o /tmp/microsoft.asc

# Konversi kunci GPG menjadi format yang bisa diterima oleh apt
echo "Menambahkan kunci GPG ke sistem..."
sudo gpg --dearmor /tmp/microsoft.asc
sudo mv /tmp/microsoft.asc.gpg /usr/share/keyrings/microsoft-archive-keyring.gpg

# Menambahkan repository Visual Studio Code ke sources.list.d jika belum ada
echo "Menambahkan repository Visual Studio Code..."
echo "deb [signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

# Update daftar paket
echo "Melakukan update daftar paket..."
sudo apt-get update

# Instal Visual Studio Code
echo "Menginstal Visual Studio Code..."
sudo apt-get install -y code

# Menampilkan pesan selesai
echo "Instalasi Visual Studio Code selesai!"
