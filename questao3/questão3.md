# TERCEIRA QUESTÃ0 🚀 



O cenário da questão apresenta várias falhas que podem causar erros graves durante o desenvolvimento, validação e entrega do software. Para solucionar estes problemas é necessário adotar praticas de devOps e integração continua e entrega continua (CI/CD)

O **empacotamento manual** pode gerar uma série de problemas, dentre eles:

- **Erros humanos:** esquecer de subir arquivos relevantes ou subir arquivos desatualizados.
- **Inconsistências na construção do build:** o cliente pode usar comandos diferentes ou ter dependências divergentes.
- **Falta de rastreabilidade:** torna impossível identificar exatamente qual código ou versão foi homologada.

Esses problemas podem ser resolvidos com a integração do **GitHub** + **Docker** ou **AWS CodePipeline + AWS ECS**. O GitHub oferece ferramentas de automação, como o **GitHub Actions**, capazes de gerar o build do software, aplicar lints e rodar testes automaticamente. Com **Docker**, é possível criar um ambiente padronizado e automatizado que sempre terá as mesmas dependências, garantindo consistência entre homologação e produção. Por exemplo, ao fazer push no GitHub, o pipeline pode gerar automaticamente o build, executar testes e criar a imagem Docker pronta para deploy. O aws ECS é um serviço de orquestração de contêineres da Amazon Web Services. Ele permite que você execute, gerencie e escale aplicativos em contêineres , como Docker.  AWS CodePipeline é um serviço de integração e entrega contínua (CI/CD) da AWS. Ele automatiza o processo de build, teste e deploy de aplicações sempre que há uma mudança no código.

**Ambientes de homologação e produção diferentes** podem conter dependências distintas entre servidores, variáveis de ambiente divergentes ou diferentes versões de bibliotecas. Essas incongruências podem gerar atrasos ou erros durante o desenvolvimento e entrega, permitindo que bugs passem pelos testes em homologação e se manifestem em produção.

As soluções para esse problema incluem:

- **Docker ou ECS:** garante que os ambientes de homologação e produção sejam idênticos, eliminando diferenças de dependências ou versões de bibliotecas.
- **Gerenciamento de variáveis sensíveis:** ferramentas como **AWS Secrets Manager** ou **SSM Parameter Store** permitem padronizar e proteger variáveis de ambiente, como chaves de API e senhas, garantindo consistência entre os ambientes.

O **atraso de uma semana** entre a homologação e o deploy manual em produção pode gerar erros e falhas semelhantes aos já mencionados. Podem ocorrer erros humanos durante o empacotamento ou configuração, e atrasos na homologação tendem a propagar-se para a produção, aumentando o tempo total de entrega.

Automatizar esse processo utilizando **Docker + GitHub Actions + Kubernetes**, juntamente com ferramentas da AWS como **CodePipeline+ ECS**, torna o fluxo menos suscetível a erros e reduz significativamente o tempo entre a homologação e o deploy em produção. Isso garante que a versão testada em homologação seja rapidamente disponibilizada em produção de forma segura e consistente.

Um primeiro rascunho do fluxograma seria:



![](https://github.com/gabriel-ferreira-da-silva/challenge/blob/main/questao3/img.png?raw=true)



Porem precisamos decidir sobre as ferramentas de CI/CD e DevOps, pode-se adotar tanto alternativas open source, como Kubernetes e Docker, quanto aderir à infraestrutura da AWS.

As soluções open source possuem vantagens como customização, independência de fornecedor e ausência de custos de licenciamento. No entanto, exigem maior esforço operacional, equipe especializada e geram maior complexidade na manutenção.

A AWS, por outro lado, vem crescendo fortemente no mercado de computação em nuvem e se destaca pela segurança, escalabilidade e integração nativa entre serviços, o que reduz falhas e acelera o processo de entrega de software.

Dessa forma, recomendaria a adoção da infraestrutura AWS, utilizando os seguintes serviços:

- **Amazon ECS**: para orquestração de containers, garantindo ambientes consistentes entre homologação e produção.
- **AWS CodePipeline + CodeBuild**: para automatizar as etapas de build, testes, lint e deploy.
- **AWS Secrets Manager**: para armazenamento seguro e centralizado de variáveis sensíveis, como chaves de API e credenciais.
- **AWS cloudWatch**: para monitorar o sistema em tempo real.



![](https://github.com/gabriel-ferreira-da-silva/challenge/blob/main/questao3/img2.png?raw=true)



Essa abordagem garante um pipeline de CI/CD robusto, seguro e escalável, alinhado às melhores práticas de DevOps.



## referencias 

What is Docker? : https://docs.docker.com/get-started/docker-overview/

O que é o Kubernetes? : https://www.ibm.com/br-pt/think/topics/kubernetes 

What can I do with CodePipeline?: https://docs.aws.amazon.com/codepipeline/latest/userguide/welcome-what-can-I-do.html

AWS Market Share 2025: Insights into the Buyer Landscape: https://hginsights.com/blog/aws-market-report-buyer-landscape

The Evolution of AWS and Its Relationship with the Open Source Ecosystem: https://aws.plainenglish.io/the-evolution-of-aws-and-its-relationship-with-the-open-source-ecosystem-e92ba7a52ff4

 
