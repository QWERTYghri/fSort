#!/bin/lua

--[[
 * main File for util
 *
 * @QWERTYghri
]]

local lfs       = require ( "lfs" ) -- luafilesystem dep

-- Here because funcList
local function errMsg ( str )
        io.write ( str );
        os.exit ()
end

-- Glob Vars
local input     = {}
local target    = "./" -- Default
local openP     = "" -- Default

local funcList =
{
        ["--input"] = 
        function ( argPos )
                
        end,

        ["--tdir"] = 
        function ( argPos )
                
        end,

        ["--open"] = 
        function ( argPos )
                local args = arg[argPos + 1]

                if ( lfs.attributes ( args ) ) then
                        openP = args
                else
                        errMsg ( string.format ( "Error: path doesn't exist || mangled args\nExiting...\n\n" ) )
                end

                return argPos + 2
        end
}

-- Functions
local function argParse ()
        local i = 1

        while ( i <= #arg ) do --pairs won't do good here, Also seems like for loops are much more references that actual variables. so fuck this
                if ( funcList[arg[i]] ~= nil ) then
                        i = funcList[arg[i]] ( i )
                else
                        errMsg ( string.format ( "Error: flag not known: \"%s\"\nExiting...\n\n", arg[i] ) )
                end
                i = i + 1
        end
        os.execute ( openP )
end

local function main () 
        argParse ()
end
main ()
