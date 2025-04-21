#!/bin/bash

echo "Adicionando grupos..."

for group in GRP_ADM GRP_VEN GRP_SEC; do
  groupadd $group
done

echo "Adicionando usuários aos grupos..."

useradd carlos -m -s /bin/bash -G GRP_ADM
useradd maria -m -s /bin/bash -G GRP_ADM
useradd joao -m -s /bin/bash -G GRP_ADM
useradd debora -m -s /bin/bash -G GRP_VEN
useradd sebastiana -m -s /bin/bash -G GRP_VEN
useradd roberto -m -s /bin/bash -G GRP_VEN
useradd josefina -m -s /bin/bash -G GRP_SEC
useradd amanda -m -s /bin/bash -G GRP_SEC
useradd rogerio -m -s /bin/bash -G GRP_SEC

for user in carlos maria joao debora sebastiana roberto josefina amanda rogerio; do
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
