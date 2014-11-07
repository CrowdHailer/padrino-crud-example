Padrino Crud Example Application
================================

## Steps
1. Create project with padrino generator

  > $ padrino g project crud -d sequel -t minitest -e erb --tiny

  *tiny flag replaces controller, mailer & helper directories with single ruby file*

2. Setup failing test for homepage route
  *Use MiniTest::Test, my favourite*

3. Create test dir and lib for friend object

  > $ mkdir test/friend lib
  > $ touch lib/friend.rb test/friend/friend_test.rb

  *Add failing test for friend object*

4. Create Database table
  *Light weight database with sqlite, to clear database delete files in db*
