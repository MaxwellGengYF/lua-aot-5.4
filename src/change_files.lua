local p = os.scriptdir()
for _,v in ipairs(os.files(p .. "/*.c")) do
    os.mv(path.join(p, v), path.join(p, path.basename(v) .. ".cpp"))
end