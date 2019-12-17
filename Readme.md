# Ruby module for pdfgeneratorapi.com
Ruby module for [PDF Generator API](https://pdfgeneratorapi.com).

### Install
Require this package with npm using the following command:
```bash
gem install pdf_generator_api
```
Or Add in `Gemfile`
```bash
gem 'pdf_generator_api', '~> 0.0.1'
```



### Usage
```Ruby

require 'pdf-generator-api'

Client = PDFGeneratorAPI.new({"X-Auth-Key" => '{your_api_key}' , "X-Auth-Secret" => '{your_secret_key}', "X-Auth-Workspace"=> '{your_workplace}', "Content-Type" => "application/json; charset=utf-8", "Accept" => "application/json"})

response = Client.getAll("", "")

response = response = Client.output('{template_id_retrived_with_getAll}', data , "pdf", "Sample Name", {name: "Sample Name", format:"pdf", output: "base64"})
```