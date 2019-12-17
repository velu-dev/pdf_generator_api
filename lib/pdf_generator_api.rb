require "httparty"
require "byebug"
class PDFGeneratorAPI
  include HTTParty

    def initialize(headers)
      $headers = headers
      $base_url = "https://us1.pdfgeneratorapi.com/api/v3/"
    end
    def getAll(access, tags)
        response = HTTParty.get("#{$base_url}templates", {headers:  $headers})
          response.body
    end
    def get(template)
      response = HTTParty.get("#{$base_url}templates/#{template}", {headers:  $headers})
      response.body
    end
    def  create(name)
      response = HTTParty.post("#{$base_url}templates", {headers:  $headers, body: {name: name}})
      response.body
    end
    def output(template, data, format, name, params)
      config = {
        name: params[:name].nil? ? "sample" : params[:name],
        format: params[:format].nil? ? "pdf" : params[:format],
        output: params[:output].nil? ? "base64" : params[:output]
      }

      query_params = "?name="+ config[:name] + "&&format="+ config[:format] + "&&output=" + config[:output]
      response = HTTParty.post("#{$base_url}templates/#{template}/output" + query_params, {body: data, headers:  $headers})
      response.body
    end
    def editor(template, data, params)
      response = HTTParty.get("#{$base_url}templates/#{template}/editor" + query_params, {body: data, headers:  $headers})
      response.body
    end
    def delete(template)
      response = HTTParty.delete("#{$base_url}templates/#{template}", {headers:  $headers})
      response.body
    end
    def copy(template, name)
      response = HTTParty.post("#{$base_url}templates/#{template}/copy", {headers:  $headers, body: {name: name}})
      response.body
    end
    def delete_workspace(workspaces)
      response = HTTParty.delete("#{$base_url}workspaces/#{workspaces}", {headers:  $headers})
      response.body
    end
    def sendRequest(method, resource, config)
      # base_url = "#{$base_url}"
      # HTTParty

    end
  end