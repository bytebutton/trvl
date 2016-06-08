Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  s.name              = 'ffaker'
  s.version           = '1.23.0'
  s.date              = '2014-01-24'
  s.rubyforge_project = 'ffaker'

  s.license = 'MIT'

  s.summary     = "Faster Faker, generates dummy data."
  s.description = "Faster Faker, generates dummy data."

  s.authors  = ["Emmanuel Oga"]
  s.email    = 'EmmanuelOga@gmail.com'
  s.homepage = 'http://github.com/emmanueloga/ffaker'

  s.require_paths = %w[lib]

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.md LICENSE Changelog.md]

  # = MANIFEST =
  s.files = %w[
    Changelog.md
    Gemfile
    LICENSE
    README.md
    Rakefile
    ffaker.gemspec
    lib/ffaker.rb
    lib/ffaker/address.rb
    lib/ffaker/address_au.rb
    lib/ffaker/address_br.rb
    lib/ffaker/address_ca.rb
    lib/ffaker/address_da.rb
    lib/ffaker/address_de.rb
    lib/ffaker/address_fr.rb
    lib/ffaker/address_mx.rb
    lib/ffaker/address_se.rb
    lib/ffaker/address_sn.rb
    lib/ffaker/address_uk.rb
    lib/ffaker/address_us.rb
    lib/ffaker/bacon_ipsum.rb
    lib/ffaker/company.rb
    lib/ffaker/company_se.rb
    lib/ffaker/conference.rb
    lib/ffaker/data/address/city_suffixes
    lib/ffaker/data/address/country
    lib/ffaker/data/address/country_code
    lib/ffaker/data/address/neighborhood
    lib/ffaker/data/address/street_suffix
    lib/ffaker/data/address_br/city
    lib/ffaker/data/address_br/state
    lib/ffaker/data/address_br/state_abbr
    lib/ffaker/data/address_ca/province
    lib/ffaker/data/address_da/city
    lib/ffaker/data/address_da/kommune
    lib/ffaker/data/address_da/street
    lib/ffaker/data/address_de/city
    lib/ffaker/data/address_de/state
    lib/ffaker/data/address_fr/city
    lib/ffaker/data/address_mx/state
    lib/ffaker/data/address_mx/state_abbr
    lib/ffaker/data/address_se/city
    lib/ffaker/data/address_se/countries
    lib/ffaker/data/address_se/street
    lib/ffaker/data/address_sn/arrondissements
    lib/ffaker/data/address_sn/departements
    lib/ffaker/data/address_sn/regions
    lib/ffaker/data/address_uk/county
    lib/ffaker/data/address_us/state
    lib/ffaker/data/address_us/state_abbr
    lib/ffaker/data/address_us/state_and_territories_abbr
    lib/ffaker/data/bacon_ipsum/bacon_words
    lib/ffaker/data/company/bs_mid
    lib/ffaker/data/company/bs_pos
    lib/ffaker/data/company/bs_pre
    lib/ffaker/data/company/catch_mid
    lib/ffaker/data/company/catch_pos
    lib/ffaker/data/company/catch_pre
    lib/ffaker/data/company/position_areas
    lib/ffaker/data/conference/conference_list
    lib/ffaker/data/dizzle_ipsum/dizzle_words
    lib/ffaker/data/education/major_noun
    lib/ffaker/data/education/school_suffix
    lib/ffaker/data/healthcare_ipsum/healthcare_words
    lib/ffaker/data/hipster_ipsum/hipster_words
    lib/ffaker/data/job/job_adj
    lib/ffaker/data/job/job_noun
    lib/ffaker/data/job/job_prefix
    lib/ffaker/data/job_fr/job_nouns
    lib/ffaker/data/job_fr/job_prefixes
    lib/ffaker/data/lorem/characters
    lib/ffaker/data/lorem/words
    lib/ffaker/data/lorem_ar/words
    lib/ffaker/data/lorem_cn/words
    lib/ffaker/data/lorem_fr/words
    lib/ffaker/data/movie/adj_and_adv
    lib/ffaker/data/movie/nouns
    lib/ffaker/data/movie/prefixes
    lib/ffaker/data/name/first_names
    lib/ffaker/data/name/last_names
    lib/ffaker/data/name_br/first_names
    lib/ffaker/data/name_br/last_names
    lib/ffaker/data/name_cn/first_names
    lib/ffaker/data/name_cn/last_names
    lib/ffaker/data/name_cs/prefixes
    lib/ffaker/data/name_da/female_first_names
    lib/ffaker/data/name_da/last_names
    lib/ffaker/data/name_da/male_first_names
    lib/ffaker/data/name_de/first_names
    lib/ffaker/data/name_de/last_names
    lib/ffaker/data/name_fr/first_names
    lib/ffaker/data/name_fr/last_names
    lib/ffaker/data/name_ga/first_names_female
    lib/ffaker/data/name_ga/first_names_male
    lib/ffaker/data/name_it/first_names
    lib/ffaker/data/name_it/last_names
    lib/ffaker/data/name_ja/first_names
    lib/ffaker/data/name_ja/last_names
    lib/ffaker/data/name_kr/first_names
    lib/ffaker/data/name_kr/last_names
    lib/ffaker/data/name_mx/female_first_names
    lib/ffaker/data/name_mx/last_names
    lib/ffaker/data/name_mx/male_first_names
    lib/ffaker/data/name_nb/first_names_female
    lib/ffaker/data/name_nb/first_names_male
    lib/ffaker/data/name_nb/last_names
    lib/ffaker/data/name_ph/autochthonous_surnames
    lib/ffaker/data/name_ph/spanish_surnames
    lib/ffaker/data/name_se/first_names_female
    lib/ffaker/data/name_se/first_names_male
    lib/ffaker/data/name_se/last_names
    lib/ffaker/data/name_sn/first_names_female
    lib/ffaker/data/name_sn/first_names_male
    lib/ffaker/data/name_sn/last_names
    lib/ffaker/data/name_vn/first_names
    lib/ffaker/data/name_vn/last_names
    lib/ffaker/data/name_vn/middle_names
    lib/ffaker/data/phone_number_se/phone_prefix
    lib/ffaker/data/product/adj
    lib/ffaker/data/product/b1
    lib/ffaker/data/product/noun
    lib/ffaker/data/skill/specialty_end
    lib/ffaker/data/skill/specialty_start
    lib/ffaker/data/skill/tech_skills
    lib/ffaker/data/venue/venue_list
    lib/ffaker/dizzle_ipsum.rb
    lib/ffaker/education.rb
    lib/ffaker/geolocation.rb
    lib/ffaker/healthcare_ipsum.rb
    lib/ffaker/hipster_ipsum.rb
    lib/ffaker/html_ipsum.rb
    lib/ffaker/identification.rb
    lib/ffaker/identification_es.rb
    lib/ffaker/identification_es_cl.rb
    lib/ffaker/identification_es_co.rb
    lib/ffaker/internet.rb
    lib/ffaker/internet_se.rb
    lib/ffaker/job.rb
    lib/ffaker/job_fr.rb
    lib/ffaker/lorem.rb
    lib/ffaker/lorem_ar.rb
    lib/ffaker/lorem_cn.rb
    lib/ffaker/lorem_fr.rb
    lib/ffaker/movie.rb
    lib/ffaker/name.rb
    lib/ffaker/name_br.rb
    lib/ffaker/name_cn.rb
    lib/ffaker/name_cs.rb
    lib/ffaker/name_da.rb
    lib/ffaker/name_de.rb
    lib/ffaker/name_fr.rb
    lib/ffaker/name_ga.rb
    lib/ffaker/name_it.rb
    lib/ffaker/name_ja.rb
    lib/ffaker/name_kr.rb
    lib/ffaker/name_mx.rb
    lib/ffaker/name_nb.rb
    lib/ffaker/name_ph.rb
    lib/ffaker/name_ru.rb
    lib/ffaker/name_se.rb
    lib/ffaker/name_sn.rb
    lib/ffaker/name_vn.rb
    lib/ffaker/nato_alphabet.rb
    lib/ffaker/phone_number.rb
    lib/ffaker/phone_number_au.rb
    lib/ffaker/phone_number_da.rb
    lib/ffaker/phone_number_de.rb
    lib/ffaker/phone_number_fr.rb
    lib/ffaker/phone_number_mx.rb
    lib/ffaker/phone_number_se.rb
    lib/ffaker/phone_number_sg.rb
    lib/ffaker/phone_number_sn.rb
    lib/ffaker/product.rb
    lib/ffaker/skill.rb
    lib/ffaker/ssn.rb
    lib/ffaker/ssn_se.rb
    lib/ffaker/string.rb
    lib/ffaker/time.rb
    lib/ffaker/unit.rb
    lib/ffaker/unit_english.rb
    lib/ffaker/unit_metric.rb
    lib/ffaker/utils/array_utils.rb
    lib/ffaker/utils/module_utils.rb
    lib/ffaker/venue.rb
    scripts/benchmark.rb
    scripts/profile.sh
    scripts/profiling.rb
    test/helper.rb
    test/test_address.rb
    test/test_address_au.rb
    test/test_address_br.rb
    test/test_address_ca.rb
    test/test_address_da.rb
    test/test_address_de.rb
    test/test_address_mx.rb
    test/test_address_se.rb
    test/test_address_sn.rb
    test/test_address_uk.rb
    test/test_address_us.rb
    test/test_array_utils.rb
    test/test_bacon_ipsum.rb
    test/test_company.rb
    test/test_company_se.rb
    test/test_conference.rb
    test/test_dizzle_ipsum.rb
    test/test_education.rb
    test/test_faker.rb
    test/test_geolocation.rb
    test/test_healthcare_ipsum.rb
    test/test_hipster_ipsum.rb
    test/test_html_ipsum.rb
    test/test_identification.rb
    test/test_identification_co.rb
    test/test_identification_es.rb
    test/test_identification_es_cl.rb
    test/test_internet.rb
    test/test_internet_se.rb
    test/test_job.rb
    test/test_job_fr.rb
    test/test_lorem.rb
    test/test_lorem_ar.rb
    test/test_lorem_cn.rb
    test/test_lorem_fr.rb
    test/test_module_utils.rb
    test/test_movie.rb
    test/test_name.rb
    test/test_name_br.rb
    test/test_name_cn.rb
    test/test_name_cs.rb
    test/test_name_de.rb
    test/test_name_fr.rb
    test/test_name_ga.rb
    test/test_name_it.rb
    test/test_name_ja.rb
    test/test_name_kr.rb
    test/test_name_mx.rb
    test/test_name_nb.rb
    test/test_name_ph.rb
    test/test_name_ru.rb
    test/test_name_se.rb
    test/test_name_sn.rb
    test/test_nato_alphabet.rb
    test/test_phone_number.rb
    test/test_phone_number_au.rb
    test/test_phone_number_de.rb
    test/test_phone_number_mx.rb
    test/test_phone_number_se.rb
    test/test_phone_number_sg.rb
    test/test_phone_number_sn.rb
    test/test_skill.rb
    test/test_ssn.rb
    test/test_ssn_se.rb
    test/test_string.rb
    test/test_time.rb
    test/test_units.rb
    test/test_units_english.rb
    test/test_units_metric.rb
    test/test_venue.rb
  ]
  # = MANIFEST =

  s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }

  s.add_development_dependency 'rake'
  s.add_development_dependency 'test-unit'
end
