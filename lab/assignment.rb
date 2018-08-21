#!/usr/local/bin/ruby
cmd = "sudo apt-get update; sudo apt-get install unzip; wget https://releases.hashicorp.com/terraform/0.11.1/terraform_0.11.1_linux_amd64.zip; unzip terraform_0.11.1_linux_amd64.zip; sudo mv terraform /usr/local/bin/; terraform init"
loop do
    sleep 5
    cmd = "wget http://candidateexercise.s3-website-eu-west-1.amazonaws.com/exercise1.yaml"
    cmd = "terraform plan"
end
