FROM ruby:2.4.4-jessie

# throw errors if Gemfile has been modified since Gemfile.lock

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update; apt-get install unzip; wget https://releases.hashicorp.com/terraform/0.11.1/terraform_0.11.1_linux_amd64.zip; unzip terraform_0.11.1_linux_amd64.zip;  mv terraform /usr/local/bin/; terraform init
COPY . .
RUN ls -al
RUN chmod +x ./assignment.rb

CMD ["./assignment.rb"]
