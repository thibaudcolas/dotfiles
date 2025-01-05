#!/usr/bin/env bash

projects=(
  thibaudcolas/ranking-to-pageviews
  thibaudcolas/cookbook
  thibaudcolas/detect-wagtail
  thibaudcolas/detect-wagtail-version
  thibaudcolas/dotfiles
  thibaudcolas/draftail-playground
  thibaudcolas/draftail.org
  thibaudcolas/draftjs-conductor
  thibaudcolas/dsf-design-assets
  thibaudcolas/future-css-today
  thibaudcolas/oled-power
  thibaudcolas/stylelint-accessible
  thibaudcolas/stylelint-config-cookbook
  thibaudcolas/thib.me
  thibaudcolas/wagtail-tooling
  django/code-of-conduct
  django/deps
  django/django
  django/django-admin-demo
  django/django_admin_tests
  django/djangoproject.com
  django/dsf-working-groups
  wagtail/accessibility
  wagtail/bakerydemo
  wagtail/gsoc
  wagtail/gsod
  wagtail/guide
  wagtail/nextjs-loves-wagtail
  wagtail/rfcs
  wagtail/sphinx-wagtail-theme
  wagtail/wagtail.org
  springload/draftail
  springload/draftjs_exporter
)

for project in "${projects[@]}"; do
  git clone git@github.com:$project.git "$HOME/Dev/$project"
done
