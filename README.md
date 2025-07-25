# 🧹 ANTI BROWSER - DETECTOR

![Admin Tool](https://img.shields.io/badge/Tipo-Admin%20Script-blue)
![Batch Script](https://img.shields.io/badge/Linguagem-Batch%20(.bat)-yellow)
![Windows Only](https://img.shields.io/badge/Sistema-Windows-red)
![License: MIT](https://img.shields.io/badge/Licença-MIT-green)

Ferramenta em Batch (.bat) para administração e controle de navegadores **Chrome, Firefox e Edge** em máquinas com Windows.

> ⚠️ **Executar como Administrador**  
> 🔒 Este script foi desenvolvido para administradores de sistemas que desejam eliminar rastros, bloquear sincronizações e limpar dados de navegadores em ambientes compartilhados ou públicos.

---

## 📌 O que este script faz

1. **Lista todos os usuários da máquina**
2. **Detecta se possuem Chrome, Firefox ou Edge**
3. **Encerra todos os processos do Microsoft Edge (inclusive segundo plano)**
4. **Exclui todos os perfis do Edge de todos os usuários**
5. **Limpa histórico, cookies e senhas salvas do Edge**
6. **Pergunta se deseja bloquear login automático do Edge com conta Microsoft**
7. **Pergunta se deseja limpar dados sensíveis do Chrome e Firefox**
8. **Pergunta se deseja excluir todos os perfis do Chrome**
9. **Finaliza o Chrome antes da exclusão para evitar falhas**

---

## 🛡️ Recursos usados

- `taskkill` – Encerra processos do navegador
- `REG ADD` – Adiciona políticas para bloquear login automático
- `rmdir /s /q` – Remove diretórios de forma recursiva e silenciosa
- `del /f /q` – Apaga arquivos como cookies, logins e cache
- `%userRoot%` (`C:\Users`) – Varre todos os perfis da máquina

---

## 🖥️ Pré-requisitos

- Windows 10 ou 11
- Permissão de **Administrador**
- Ideal para:
  - Ambientes corporativos
  - Laboratórios de informática
  - Máquinas públicas ou compartilhadas

---

## 🚀 Como usar

1. Baixe o arquivo .bat deste repositório na versão mais recente
2. Clique com o botão direito no arquivo `anti-browser.bat`
3. Selecione **"Executar como administrador"**
4. Responda `s` (sim) ou `n` (não) para cada etapa

---

## ⚠️ Aviso

> Este script **apaga permanentemente** perfis, histórico, cookies e senhas de navegação.  
> Use com responsabilidade. Todas as ações são precedidas de confirmação.

---

## 🧪 Testado em

- ✔️ Windows 10 Pro x64  
- ✔️ Windows 11 Pro x64  
- ✔️ Múltiplos usuários com sessões simultâneas

---
