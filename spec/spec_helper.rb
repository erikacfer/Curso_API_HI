require "dotenv"
require "hi_httparty"

include HiHttparty::RequestsType
HiHttparty.configure do |config_hihttparty|
  config_hihttparty.timeout_value = 10
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end

# A configuração abaixo carrega o arquivo padrão na hora de executar os testes. Para rodar as configurações
#  de outro ambiente, olhe o tópico "RODANDO O PROJETO EM OUTROS AMBIENTES"
Dotenv.load(".env.qa")
