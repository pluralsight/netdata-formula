netdata-prereqs:
  pkg.installed:
    - pkgs:
      - autoconf
      - automake
      - curl
      - gcc
      - git
      - libmnl-devel
      - libuuid-devel
      - lm-sensors
      - make
      - MySQL-python
      - nc
      - pkgconfig
      - python
      - python-psycopg2
      - PyYAML
      - zlib-devel

netdata-repo:
  git.latest:
    - name: https://github.com/firehol/netdata.git
    - depth: 1
    - target: /tmp/netdata

netdata-install:
  cmd.run:
    - name: /tmp/netdata/netdata-installer.sh --dont-start-it --dont-wait
    - cwd: /tmp/netdata
    - require:
      - git: netdata-repo
      - pkg: netdata-prereqs
