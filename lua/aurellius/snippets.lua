local ls = require("luasnip")

-- some shorthands...
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local date = function(args) return {os.date('%Y-%m-%d')} end

ls.add_snippets(nil, {
    all = {
        s("date", {
            f(date, {})
        }),
    },
    typescriptreact = {
        -- useEffect
        s("usf", {
            t({"useEffect(() =>{"," "}),
            i(0),
            t({"},["}),
            i(1),
            t({"])"})
        }),
        -- Function
        s("fun", {
            t({"function "}),
            i(1, "function_name"),
            t({"(", }),
            i(2, "parameters"),
            t({") {", "    "}),  -- This is a tab, adjust as needed
            i(0),
            t({"}"})
        }),
        -- If Statement:
        s("if", {
            t({"if ("}),
            i(1, "condition"),
            t({") {", "    "}),
            i(0),
            t({"}"})
        }),
        -- Asynchronous Function
        s("asf", {
            t({"async function "}),
            i(1, "function_name"),
            t({"(", }),
            i(2, "parameters"),
            t({") {", "    "}),  -- This is a tab, adjust as needed
            i(0),
            t({"}"})
        }),
        -- try catch
        s("tryc", {
            t({"try {", "    "}),
            i(0),
            t({"", "} catch (e) {", "    "}),
            i(1, "handle the error"),
            t({"}"})
        }),
        -- tsx component
        s("fc", {
            t({"const "}),
            i(1, "ComponentName"),
            t({" = (props: "}),
            i(2, "PropsType"),
            t({") => {", "    return (", "        <div>", "            "}),
            i(0, "component content"),
            t({"", "        </div>", "    );", "};"}),
        }),
    },
    typescript = {
        -- Function
        s("fun", {
            t({"function "}),
            i(1, "function_name"),
            t({"(", }),
            i(2, "parameters"),
            t({") {", "    "}),  -- This is a tab, adjust as needed
            i(0),
            t({"}"})
        }),
        -- If Statement:
        s("if", {
            t({"if ("}),
            i(1, "condition"),
            t({") {", "    "}),
            i(0),
            t({"}"})
        }),
        -- try catch
        s("tryc", {
            t({"try {", "    "}),
            i(0),
            t({"", "} catch (e) {", "    "}),
            i(1, "handle the error"),
            t({"}"})
        }),
        -- state variable
        s("ust", {
            t("const ["),
            i(1,"state"),
            t(","),
            i(2,"setState"),
            t("] = useState("),
            i(3,"default"),
            t(")"),
        }),
        -- Asynchronous Function
        s("asf", {
            t({"async function "}),
            i(1, "function_name"),
            t({"(", }),
            i(2, "parameters"),
            t({") {", "    "}),  -- This is a tab, adjust as needed
            i(0),
            t({"}"})
        }),
    }
})

