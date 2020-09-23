script_info = {
	["title"] = "PCS接口",
	["version"] = "0.0.1",
	["description"] = "非超级会员账号请将并行任务数设置为1",
}

function onInitTask(task, user, file)
    if task:getType() ~= TASK_TYPE_BAIDU then
        return false
    end
    if user == nil then
        task:setError(-1, "用户未登录")
		return true
	end
	local appid = 778750
	if user:isSVIP() then
		appid = 250528
	end
    task:setUris("http://pcs.baidu.com/rest/2.0/pcs/file?method=download&path="..pd.urlEncode(file.path).."&app_id="..appid)
    task:setOptions("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36")
    task:setOptions("header", "Cookie: "..user:getCookie())
    return true
end