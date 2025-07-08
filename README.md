# 🧹 ANTI BROWSER - DETECTOR

Ferramenta em Batch (.bat) para administração e controle de navegadores **Chrome, Firefox e Edge** em máquinas com Windows.

> ⚠️ **Executar como Administrador**  
> 🔒 Este script foi desenvolvido para administradores de sistemas que desejam eliminar rastros, bloquear sincronizações e limpar dados de navegadores em ambientes compartilhados ou públicos.

---

## 📌 O que este script faz

1. **Lista todos os usuários da máquina**
2. **Detecta se possuem Chrome, Firefox ou Edge**
3. **Encerra todos os processos do Microsoft Edge (inclusive de segundo plano)**
4. **Exclui todos os perfis do Edge de todos os usuários**
5. **Limpa histórico, cookies e senhas salvas do Edge**
6. **Pergunta se deseja bloquear login automático com conta Microsoft no Edge**
7. **Pergunta se deseja limpar dados sensíveis do Chrome e Firefox**
8. **Pergunta se deseja excluir todos os perfis do Chrome**
9. **Finaliza o Chrome antes da exclusão para evitar erros**

---

## 🛡️ Recursos usados

- `taskkill` – Encerra os navegadores em execução
- `REG ADD` – Insere chaves de política para bloquear login do Edge
- `rmdir /s /q` – Exclui diretórios inteiros silenciosamente
- `del /f /q` – Remove arquivos específicos (cookies, senhas, etc.)
- `%userRoot%` (`C:\Users`) – Varre todos os perfis do sistema

---

## 🖥️ Pré-requisitos

- Sistema Operacional: **Windows 10/11**
- Permissão de **Administrador**
- Ideal para ambientes como:
  - Laboratórios de informática
  - Empresas que controlam sincronização de dados
  - Máquinas públicas ou multiusuário

---

## 🚀 Como usar

1. Baixe ou clone este repositório
2. Clique com o botão direito no arquivo `anti-browser.bat`
3. Execute como **Administrador**
4. Siga as instruções no terminal (responda com `s` ou `n` para cada etapa)

---

## ⚠️ Aviso

> Este script **irá apagar permanentemente** dados de navegação, perfis, cookies, senhas e histórico.  
> Use com responsabilidade. Não há confirmação de exclusão adicional além das perguntas no terminal.

---

## 🧪 Testado em

- Windows 10 Pro x64  
- Windows 11 Pro x64  
- Múltiplos usuários logados simultaneamente

---
