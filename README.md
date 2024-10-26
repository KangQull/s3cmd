<img src="https://github.com/KangQull/s3cmd/blob/main/logoss3cmd.png" alt="Girl in a jacket" width="250" height="250">
# S3CMD VPS UBUNTU
Backup and Restore Script.

# Install S3CMD VPS
```bash
apt update

apt install s3cmd
```
# Cek version S3CMD apakah sudah ter install apa belum.
```bash
s3cmd --version
```
# Configurasi S3Storage
```bash
s3cmd --configure
```
Masukan IPI key , Acces Key dan Screet Key

Selanjutnya silahkan anda isikan endpoint dari bucket contoh "s3.amazone.com"

Selanjutnya isikan target endpoint bucketnya : %(bucket)s.endpoints3kamu.com

Set encrption password (Optional bisa di abaikan saja)

Connect via https isi dengan yes

Set Proxy Server (Optional abaikan saja)

Langkah Terakhir lakukan Konfirmasi, save dan testing isi dengan Y

Ketika proses testing berhasil ketik : Y

# Buat Script Backup

```bash
touch backups3.sh
```
```bash
nano backups3.sh
```

Copy paste script di bawah ini:
```bash
#!/bin/sh
echo 'Started Sync to Digitalocean Spaces'
date +'%a %b %e %H:%M:$S %Z %Y'
s3cmd sync --recursive --preserve /srv  s3://bucket-kamu
s3cmd sync --recursive --preserve /etc  s3://bucket-kamu
s3cmd sync --recursive --preserve /home s3://bucket-kamu
s3cmd sync --recursive --preserve /var  s3://bucket-kamu
dpkg --get-selections > dpkg.list
s3cmd sync --recursive --preserve dpkg.list s3://bucket-kamu
date +'%a %b %e %H:%M:$S %Z %Y'
echo 'Finished Sync to Digitalocean Spaces'
```

Kalau Sudah simpan dengan cara CTRL+X+Y Enter

# Menjalan kan script backup
```bash
sh backups3.sh
```

Tunggu sambil ngopi Sampai proses selesai backup.


# Cara untuk Restor backup ke VPS baru

pertama install S3CMD Seperti cara di atas sesuakan dengan s3object storage backup kalian .

# Buat Script Restore
Kalau sudah install, bikin script untuk restore backup VPS nya, paste script di bawah ini.

```bash
touch restores3.sh
```
```bash
nano restores3.sh
```
Paste Script nya
```bash
#!/bin/sh
echo 'Started Restore to your Spaces VPS'
date +'%a %b %e %H:%M:$S %Z %Y'
s3cmd get -r s3://bkvps/srv/ /srv
s3cmd get -r s3://bkvps/etc/ /etc
s3cmd get -r s3://bkvps/home/ /home
s3cmd get -r s3://bkvps/var/ /var
date +'%a %b %e %H:%M:$S %Z %Y'
echo 'Finished Restore to your Spaces VPS'
```

Tunggu Prosses restore Sampai Selesai.
