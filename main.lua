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

local msgList = 
{
        pathNonExist = "Error: path doesn't exist || mangled args\nExiting...\n\n",
        flagNotKnown = "Error: flag not known: \"%s\"\nExiting...\n\n",
        helpInfo =
-- CRINGE
[[
Usage
----------
* --input [ARGS...]   : Select what files you want to sort out; if no file exists then it'll error
* --tdir  [ARG]       : The target directory you want to sort to, ( if none exist then it'll create a new one )
* --open  [ARG]       : It'll open the file with a specified program if you specify to open it
* --help              : Gives help...

@QWERTYghri : fucking help me


]]
}

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
                        errMsg ( string.format ( msgList.pathNonExist ) )
                end

                return argPos + 2
        end,
        ["--help"] =
        function ( argPos )
                io.write ( msgList.helpInfo )
        end
}

-- Functions
local function argParse ()
        if ( #arg == 0 ) then
                errMsg ( string.format ( "No input is given...\n\n%s",  msgList.helpInfo ) )
        end
        
        -- Vars
        local i = 1

        while ( i <= #arg ) do --pairs won't do good here, Also seems like for loops are much more references that actual variables. so fuck this
                if ( funcList[arg[i]] ~= nil ) then
                        i = funcList[arg[i]] ( i ) <= #arg
                else
                        errMsg ( string.format ( msgList.flagNotKnown, arg[i] ) )
                end
                i = i + 1
        end

        os.execute ( openP )
end

local function main () 
        argParse ()
end
main ()
