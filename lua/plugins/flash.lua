return {
	"folke/flash.nvim",
	opts = {
		modes = {
			char = {
				-- enabled = false, -- Это отключит подсветку для f, F, t, T
				-- Оставляем функционал, но настраиваем визуал
				jump_labels = true,
				-- Отключаем "затемнение" остального текста
				highlight = { backdrop = false },
			},
		},
	},
}
