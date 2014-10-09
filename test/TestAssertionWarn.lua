-- TestAssertionWarn.lua - test the behavior of the asserts.warn() function.
-- Copyright (C) 2014 Pavel Tisnovsky
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

TestAssertionWarn = {
    -- required field
    metadata = {
        description = "Test the behavior of the asserts.warn() function.",
        authors = "Pavel Tisnovsky",
        emails = "ptisnovs@redhat.com",
        changed = "2014-10-09",
        tags = {"BasicTest", "SmokeTest"},
    },
}

-- Verify that the function accepts a string as its argument:
function TestAssertionWarn.testPositive01()
    warn("The warn() function expects a string as its argument.")
end

-- Verify that the function requires at least one argument:
function TestAssertionWarn.testNegative01()
    warn()
end

-- Verify that the function does not accept nil as an argument:
function TestAssertionWarn.testNegative02()
    warn(nil)
end

-- Verify that the function does not accept a boolean as an argument:
function TestAssertionWarn.testNegative03()
    warn(true)
end

-- Verify that the function does not accept a boolean as an argument:
-- (and "false" sometimes has the same meaning as "nil", so check it)
function TestAssertionWarn.testNegative04()
    warn(false)
end

-- Verify that the function does not accept an integer as an argument:
function TestAssertionWarn.testNegative05()
    warn(42)
end

-- Verify that the function does not accept a real number as an argument:
function TestAssertionWarn.testNegative06()
    warn(42.1)
end

-- Verify that the function does not accept a table as an argument:
function TestAssertionWarn.testNegative07()
    warn({1,2,3})
end

-- Verify that the function does not accept a standard function as an argument:
function TestAssertionWarn.testNegative08()
    warn(print)
end

-- Verify that the function does not accept an user defined function as an argument:
function TestAssertionWarn.testNegative09()
    local func = function()
        return 42
    end
    warn(func)
end

-- Verify that the function does not accept a closure as an argument:
function TestAssertionWarn.testNegative10()
    local closure = function()
        local i
        return function()
            i = i + 1
            return i
        end
    end
    warn(closure)
end

-- Verify that the function does not accept a coroutine as an argument:
function TestAssertionWarn.testNegative11()
    local func = coroutine.create(function ()
           print(42)
         end)
    warn(func)
end

