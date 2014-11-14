-- TestAssertionIsEmpty.lua - test the behavior of the asserts.is_empty() function
-- Copyright (C) 2014 Jaromir Hradilek
--
-- This file is part of Emender.
--
-- Emender is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; version 3 of the License.
--
-- Emender is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Emender.  If not, see <http://www.gnu.org/licenses/>.
--

TestAssertionIsEmpty = {
    -- required field
    metadata = {
        description = "Test the behavior of the asserts.is_empty() function.",
        authors = "Jaromir Hradilek",
        emails = "jhradilek@redhat.com",
        changed = "2014-11-14",
        tags = {"BasicTest", "SmokeTest"}
    }
}



--
-- Verify that the function recognizes an empty table:
--
function TestAssertionIsEmpty.testPositive1()
    is_empty({}, "table is empty")
end



--
-- Verify that the function does not accept only one argument:
--
function TestAssertionIsEmpty.testNegative01()
    is_empty("the function expects two arguments")
end



--
-- Verify that the function does not accept zero arguments:
--
function TestAssertionIsEmpty.testNegative02()
    is_empty()
end



--
-- Verify that the function recognizes a table with items:
--
function TestAssertionIsEmpty.testNegative03()
    is_empty({1}, "(expected) table is not empty")
end



--
-- Verify that the function recognizes nil:
--
function TestAssertionIsEmpty.testNegative04()
    is_empty(nil, "nil is not a table")
end



--
-- Verify that the function recognizes a Boolean:
--
function TestAssertionIsEmpty.testNegative05()
    is_empty(true, "false is not a table")
end



--
-- Verify that the function recognizes a Boolean:
--
function TestAssertionIsEmpty.testNegative06()
    is_empty(false, "false is not a table")
end



--
-- Verify that the function recognizes a number:
--
function TestAssertionIsEmpty.testNegative07()
    is_empty(0, "zero is not a table")
end



--
-- Verify that the function recognizes a string:
--
function TestAssertionIsEmpty.testNegative08()
    is_empty("", "string is not empty")
end



--
-- Verify that the function recognizes a (non empty) table:
--
function TestAssertionIsEmpty.testNegative09()
    is_empty({1,2,3}, "table is not empty")
end



--
-- Verify that the function recognizes a nested table as an argument:
--
function TestAssertionIsEmpty.testNegative10()
    is_empty({{{1},2},3}, "nested table is not empty")
end



--
-- Verify that the function recognizes a hash table as an argument:
--
function TestAssertionIsEmpty.testNegative11()
    local table1 = {}

    -- fill in the first table
    table1["first"]  = 1
    table1["second"] = 2
    table1["third"]  = 3

    is_empty(table1, "hash table is not empty")
end



--
-- Verify that the function does not accept a standard function as an argument:
--
function TestAssertionIsEmpty.testNegative12()
    is_empty(print, "function is definitely not empty")
end



--
-- Verify that the function does not accept an user defined function as an argument:
--
function TestAssertionIsEmpty.testNegative13()
    -- create local function
    local func = function()
        return 42
    end
    -- and call the is_empty() function with the function as its argument
    is_empty(func, "function is definitely not empty")
end



--
-- Verify that the function does not accept a closure as an argument:
--
function TestAssertionIsEmpty.testNegative14()
    -- create local closure
    local closure = function()
        local i
        return function()
            i = i + 1
            return i
        end
    end
    -- and call the is_empty() function with the closure as its argument
    is_empty(closure, "closure is definitely not empty")
end



--
-- Verify that the function does not accept a coroutine as an argument:
--
function TestAssertionIsEmpty.testNegative15()
    -- create local coroutine
    local func = coroutine.create(function ()
           print(42)
         end)
    -- and call the is_empty() function with the coroutine as its argument
    is_empty(func, "coroutine is definitely not empty")
end

