Gem::Specification.new do |spec|
  spec.name     = "x86ptr"
  spec.version  = "1.0"
  spec.authors  = ["Mehdi Karimi"]
  spec.email    = ["x86ptr@gmail.com"]

  spec.summary  = "x86ptr's personal blog"
  spec.homepage = "https://github.com/x86ptr/x86ptr.github.io"
  spec.license  = "MIT"

  spec.metadata["plugin_type"] = "theme"

  spec.files = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r!^(assets|_(includes|layouts|sass)/|(LICENSE|README)((\.(txt|md|markdown)|$)))!i)
  end

  spec.add_runtime_dependency "jekyll", ">= 3.5", "< 5.0"

  spec.add_development_dependency "bundler"
end
