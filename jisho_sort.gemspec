Gem::Specification.new do |s|
  s.name              = 'jisho_sort'
  s.version           = '0.0.5'
  s.summary           = 'Sort Japanese letters in dictionary order.'
  s.files             = Dir['{lib}/**/*.rb', 'bin/*', 'LICENSE', '*.md']
  s.require_path      = 'lib'
  s.authors           = ['fvknk97034']
  s.homepage          = 'https://github.com/fvknk97034'
  s.description       = 'Sort Japanese letters, including Chinese letters, in dictionary order.'

  s.rubygems_version  = '>= 3.6.2'

  s.add_dependency 'ffi', '>= 1.9.0'
  s.add_dependency 'natto'

  s.metadata['rubygems_mfa_required'] = 'true'
  s.metadata['source_code_uri'] = 'https://github.com/fvknk97034/jisho_sort.git'
end
