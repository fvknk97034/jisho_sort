Gem::Specification.new do |s|
  s.name              = 'jisho_sort'
  s.version           = '0.0.0'
  s.summary           = 'Sort Japanese characters in dictionary order.'
  s.files             = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  s.require_path      = 'lib'
  s.authors           = ['fvknk']
  s.email             = 'hoge@example.com'
  s.homepage          = 'https://github.com/fvknk'
  s.description       = 'Sort Japanese characters, including kanji, in dictionary order.'

  s.add_dependency 'ffi', '>= 1.9.0'
  s.add_dependency 'natto'
  s.metadata['rubygems_mfa_required'] = 'true'
end
