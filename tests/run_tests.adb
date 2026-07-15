-- run_tests.adb
-- Main test runner procedure
-- This is the entry point for running tests from the terminal

with Round_Robin_Tests;

procedure Run_Tests is
begin
   Round_Robin_Tests.Run_All_Tests;
end Run_Tests;
