local lib = import('lib')

function get_outdir()
    return "build/.luaot/"
end

function out_dir(sourcefile)
    return path.join(get_outdir(), path.directory(sourcefile), path.basename(sourcefile) .. ".cpp")
end