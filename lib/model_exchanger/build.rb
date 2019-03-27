module ModelExchanger
  class Build
    def initialize(url, service)
      retries = 0
      exchange = ModelExchanger::BuildHash.new
      # Gibt sicherlich ne cleverere Möglichkeit mehrere Versuche zu starten, den Request auszuführen. Sleep ist auch nicht so super...
      while retries < 3
        request = ModelExchanger::Send.new(exchange, url, service)
        if request.res.options[:response_code] >= 400
          retries += 1
          sleep 1
        elsif ( request.res.options[:response_code] >= 400 && retries >= 3 )
          puts 'sende mail oder raise error für log, dass Update nicht funktioniert hat'
          break
        else
          break
        end
      end
    end
  end
end
