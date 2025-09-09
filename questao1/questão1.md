# PRIMEIRA QUESTÃ0 🖥️



![](EER.png)

O modelo foi projetado seguindo boas práticas de banco de dados, de forma a evitar redundância e garantir consistência.

- **Benchmark** e **Controle** têm uma relação 1:N, por isso `benchmark_id` foi definido em controle como chave estrangeira.

- **Controle** e **Controle_Estado** também têm relação 1:N. Para permitir o registro histórico, cada mudança de estado é armazenada em *controle_estado*, que tem como chave primária composta (`controle_id`, `time`). Dessa forma, um mesmo Controle pode ter vários estados registrados ao longo do tempo, discriminados pelo `time`, possibilitando a reconstrução do histórico e a obtenção do estado em qualquer instante.

  
