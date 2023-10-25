require 'httparty'

class OpenFDAAPI
    include HTTParty
    base_uri 'https://api.fda.gov'

    def self.random_drug_name
        query = { limit: 1, skip: rand(100) }
        response = self.get('/drug/label.json', query: query)

        if response.success?
            drug_data = response['results'][0]['openfda']['generic_name']
            random_drug_name = drug_data.sample

            return random_drug_name unless random_drug_name.nil?
        end

        "Не удалось получить информацию о лекарстве."
    rescue StandardError => e
        puts "Ошибка запроса к OpenFDA API: #{e.message}"
        return "Не удалось получить информацию о лекарстве."
    end
end
