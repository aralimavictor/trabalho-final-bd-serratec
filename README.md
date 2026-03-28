# 🦷 Sistema de Gestão de Clínica Odontológica

> Projeto final da disciplina de Banco de Dados — Residência TIC Serratec 2026.1

Modelagem e implementação de um banco de dados relacional para gestão completa de uma clínica odontológica, cobrindo cadastro de pacientes e dentistas, agendamento de consultas, controle de procedimentos realizados e geração de relatórios gerenciais.

---

## 📋 Sumário

- [Sobre o Projeto](#sobre-o-projeto)
- [Tecnologias](#tecnologias)
- [Modelo Conceitual](#modelo-conceitual)
- [Modelo Lógico](#modelo-lógico)
- [Equipe](#equipe)

---

## Sobre o Projeto

O sistema foi desenvolvido para atender às necessidades operacionais de uma clínica odontológica. O banco de dados contempla o controle de pacientes, dentistas e suas especialidades, horários de atendimento, consultas com diferentes status (agendada, concluída e cancelada), procedimentos odontológicos vinculados a cada atendimento, além de índices de desempenho e views para consultas gerenciais.

O projeto inclui também um conjunto de queries analíticas que permitem extrair informações como ranking de consultas por dentista e especialidade, pacientes com maior frequência de atendimento, procedimentos sem registros e agenda filtrada por dia da semana.

---

## Tecnologias

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=databricks&logoColor=white)

---

## Modelo Conceitual

> Representa as entidades do domínio e seus relacionamentos de forma abstrata, sem detalhar aspectos de implementação.

<p align="center">
  <img width="1212" alt="Modelo Conceitual" src="https://github.com/user-attachments/assets/a4218e39-e18a-43a1-995e-49c33245492f" />
</p>

---

## Modelo Lógico

> Detalha a estrutura das tabelas, atributos, tipos de dados, chaves primárias e estrangeiras.

<p align="center">
  <img width="1401" alt="Modelo Lógico" src="https://github.com/user-attachments/assets/04505243-3834-479d-beb8-894bc380e9f4" />
</p>

---

### Índices e View

Foram criados **3 índices** para otimizar as operações mais frequentes:

- `idx_paciente_cpf` — busca de pacientes por CPF na recepção
- `idx_consulta_data` — filtragem de agenda por período (dia, semana, mês)
- `idx_consulta_dentista` — listagem de consultas por dentista

A view **`vw_consultas`** consolida dados de paciente, dentista, data, status e procedimentos realizados em uma única consulta, facilitando a geração de relatórios.

## Equipe

Projeto desenvolvido por:

| Nome |
|---|
| Henrique Dlugokenski Zorati |
| Ícaro de Assis Pinheiro |
| João Gabriel Silva Barros |
| Natasha Von Markendorf |
| Victor de Araújo Lima |
| Yasmim Ferreira Veríssimo |

---

<p align="center">
  Desenvolvido durante a <strong>Residência TIC Serratec 2026.1</strong>
</p>
