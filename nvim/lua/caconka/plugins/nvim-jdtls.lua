-- Java LSP
return {
	"mfussenegger/nvim-jdtls",
	ft = "java", -- Enable only on .java file extensions
	root_dir = vim.fs.dirname(vim.fs.find({'WORKSPACE', 'BUILD', 'BUILD.bazel', '.git', 'gradlew', 'mvnw'}, { upward = true })[1]),
}
