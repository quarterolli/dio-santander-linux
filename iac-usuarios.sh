#!/bin/bash

echo "Adicionando grupos..."

for group in GRP_ADM GRP_VEN GRP_SEC; do
  groupadd $group
done

echo "Adicionando usuários aos grupos..."

for user in carlos maria joao; do
  useradd $user -m -s /bin/bash -G GRP_ADM
  echo $user:321 | chpasswd
  passwd -e $user
done
for user in debora sebastiana roberto; do
  useradd $user -m -s /bin/bash -G GRP_VEN
  echo $user:321 | chpasswd
  passwd -e $user
done
for user in josefina amanda rogerio; do
  useradd $user -m -s /bin/bash -G GRP_SEC
  echo $user:321 | chpasswd
  passwd -e $user
done

echo "Criando diretórios de trabalho e atribuindo permissões..."

mkdir /publico /adm /ven /sec

chmod 777 /publico
chmod 770 /adm /ven /sec

chown root:root /publico
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

echo "Infraestrutura de usuários configurada com sucesso!"
