FROM ubuntu:22.04
# Actualiza el sistema y instala los paquetes necesarios
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl wget unzip jq
# Descarga el binario de Terraform y colócalo en el directorio /usr/local/bin
RUN wget https://releases.hashicorp.com/terraform/0.14.10/terraform_0.14.10_linux_amd64.zip && \
    unzip terraform_0.14.10_linux_amd64.zip && \
    mv terraform /usr/local/bin && \
    rm terraform_0.14.10_linux_amd64.zip

# Establece el directorio de trabajo
WORKDIR /app

# Ejecuta el contenedor en modo interactivo

COPY . .
RUN chmod +x terraform
RUN cat main.tf
RUN terraform init 
RUN terraform plan -out=tfplan
#RUN terraform apply --auto-approve tfplan
#RUN terraform destroy --auto-approve
#RUN cat tfplan
ENTRYPOINT [ "" ]
CMD ["/bin/bash"]

# docker build -t terraform:cesar1.0 .
# docker run terraform:cesar1.8 terraform apply --auto-approve tfplan
# docker run terraform:cesar1.8 terraform destroy --auto-approve