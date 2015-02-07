{% import 'setvars' as vars with context %}
devscripts:
  pkg.installed

build_calamari_clients:
  cmd.run:
    - user: {{vars.username}}
    - name: make dpkg
    - env:
      - REAL_BUILD: 'y'
    - cwd: {{vars.builddir}}/clients
    - require:
      - git: git_clone
      - pkg: devscripts

copy_calamari_clients:
  cmd.run:
    - name: cp calamari-clients*.deb {{vars.pkgdest}}
    - cwd: {{vars.builddir}}
    - require:
      - cmd: build_calamari_clients
