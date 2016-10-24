htmlSource := $(wildcard html-source/*.html)
simpleTables := $(patsubst html-source/%.html,simple-tables/%.md,$(htmlSource))
multilineTables := $(patsubst html-source/%.html,multiline-tables/%.md,$(htmlSource))
gridTables := $(patsubst html-source/%.html,grid-tables/%.md,$(htmlSource))
pipeTables := $(patsubst html-source/%.html,pipe-tables/%.md,$(htmlSource))
htmlTables := $(patsubst html-source/%.html,html-tables/%.md,$(htmlSource))


all: $(simpleTables) $(multilineTables) $(gridTables) $(pipeTables)

simple-tables/%.md: html-source/%.html
	mkdir -p simple-tables
	pandoc -t markdown-multiline_tables-grid_tables-pipe_tables --wrap=none -o $@ $<

multiline-tables/%.md: html-source/%.html
	mkdir -p multiline-tables
	pandoc -t markdown-simple_tables-grid_tables-pipe_tables --wrap=none -o $@ $<

grid-tables/%.md: html-source/%.html
	mkdir -p grid-tables
	pandoc -t markdown-simple_tables-multiline_tables-pipe_tables --wrap=none -o $@ $<

pipe-tables/%.md: html-source/%.html
	mkdir -p pipe-tables
	pandoc -t markdown-simple_tables-multiline_tables-grid_tables --wrap=none -o $@ $<

html-tables/%.md: html-source/%.html
	mkdir -p html-tables
	pandoc -t markdown-simple_tables-multiline_tables-grid_tables-pipe_tables --wrap=none -o $@ $<

clean:
	rm -f $(simpleTables) $(multilineTables) $(gridTables) $(pipeTables)
