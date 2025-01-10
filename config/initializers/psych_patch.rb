require 'psych'

module YAML
  def self.load_with_aliases(yaml, **kwargs)
    kwargs[:aliases] = true
    Psych.safe_load(yaml, **kwargs)
  end

  def self.load_file_with_aliases(filename, **kwargs)
    kwargs[:aliases] = true
    Psych.safe_load(File.read(filename), **kwargs)
  end

  singleton_class.send(:alias_method, :load, :load_with_aliases)
  singleton_class.send(:alias_method, :load_file, :load_file_with_aliases)
end
