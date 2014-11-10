module Samples
  @samples = {}
  def sample_path(name)
    File.expand_path "../../samples/#{ name }.json", __FILE__
  end
  def sample_data(name)
    Oj.load_file sample_path(name)
  end
  def sample(name, key = name)
    sample_data(name).fetch key
  end
end
