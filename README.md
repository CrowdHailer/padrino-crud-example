Padrino Crud Example Application
================================

## Steps
1. Create project with padrino generator

> $ padrino g project crud -d sequel -t minitest -e erb --tiny

*tiny flag replaces controller, mailer & helper directories with single ruby file*

2. Setup failing test for homepage route
*Use MiniTest::Test, my favourite*