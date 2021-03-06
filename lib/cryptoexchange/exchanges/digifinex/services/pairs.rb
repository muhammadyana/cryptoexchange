module Cryptoexchange::Exchanges
  module Digifinex
    module Services
      class Pairs < Cryptoexchange::Services::Pairs
        PAIRS_URL = "#{Cryptoexchange::Exchanges::Digifinex::Market::API_URL}/market/digifinex"

        def fetch
          output = super
          adapt(output)
        end

        def adapt(output)
          output['data']['symbol_pairs'].map do |output|
            base, target = output.split('_')
            Cryptoexchange::Models::MarketPair.new(
              base:   base,
              target: target,
              market: Digifinex::Market::NAME
            )
          end
        end
      end
    end
  end
end
