local hi = require('neviraide-ui.themes').get_theme_tb('colors')
local d = require('neviraide-ui.icons.utils').decoder

---@type Nonicons
return {
  ['svg'] = { icon = d(61801), color = hi.orange, name = 'Svg' },
  ['git'] = { icon = d(61784), color = hi.grey_fg, name = 'GitLogo' },
  ['.gitattributes'] = {
    icon = d(61784),
    color = hi.one_bg3,
    name = 'GitAttributes',
  },
  ['.gitconfig'] = {
    icon = d(61784),
    color = hi.one_bg3,
    name = 'GitConfig',
  },
  ['.gitignore'] = {
    icon = d(61784),
    color = hi.one_bg3,
    name = 'GitIgnore',
  },
  ['.gvimrc'] = {
    icon = d(61932),
    color = hi.vibrant_green,
    name = 'Gvimrc',
  },
  ['.npmignore'] = {
    icon = d(61843),
    color = hi.baby_pink,
    name = 'NPMIgnore',
  },
  ['.vimrc'] = {
    icon = d(61932),
    color = hi.vibrant_green,
    name = 'Vimrc',
  },
  ['.zshrc'] = {
    icon = d(61911),
    color = hi.one_bg3,
    name = 'Zshrc',
  },
  ['Dockerfile'] = {
    icon = d(61758),
    color = hi.nord_blue,
    name = 'Dockerfile',
  },
  ['Gemfile$'] = {
    icon = d(61880),
    color = hi.baby_pink,
    name = 'Gemfile',
  },
  ['LICENSE'] = {
    icon = d(61767),
    color = hi.yellow,
    name = 'License',
  },
  ['bash'] = {
    icon = d(61911),
    color = hi.one_bg3,
    name = 'Bash',
  },
  ['c'] = {
    icon = d(61718),
    color = hi.nord_blue,
    name = 'C',
  },
  ['c++'] = {
    icon = d(61719),
    color = hi.baby_pink,
    name = 'CPlusPlus',
  },
  ['cc'] = {
    icon = d(61719),
    color = hi.baby_pink,
    name = 'CPlusPlus',
  },
  ['conf'] = {
    icon = d(61781),
    color = hi.one_bg3,
    name = 'Conf',
  },
  ['cp'] = {
    icon = d(61719),
    color = hi.nord_blue,
    name = 'Cp',
  },
  ['cpp'] = {
    icon = d(61719),
    color = hi.nord_blue,
    name = 'Cpp',
  },
  ['css'] = {
    icon = d(61743),
    color = hi.nord_blue,
    name = 'Css',
  },
  ['dart'] = {
    icon = d(61744),
    color = hi.nord_blue,
    name = 'Dart',
  },
  ['db'] = {
    icon = d(61746),
    color = hi.one_bg3,
    name = 'Db',
  },
  ['dockerfile'] = {
    icon = d(61758),
    color = hi.nord_blue,
    name = 'Dockerfile',
  },
  ['fish'] = {
    icon = d(61911),
    color = '#4d5a5e',
    name = 'Fish',
  },
  ['go'] = {
    icon = d(61789),
    color = hi.nord_blue,
    name = 'Go',
  },
  ['htm'] = {
    icon = d(61799),
    color = hi.baby_pink,
    name = 'Htm',
  },
  ['html'] = {
    icon = d(61799),
    color = hi.baby_pink,
    name = 'Html',
  },
  ['ico'] = {
    icon = d(61801),
    color = hi.yellow,
    name = 'Ico',
  },
  ['java'] = {
    icon = d(61809),
    color = hi.baby_pink,
    name = 'Java',
  },
  ['jpeg'] = {
    icon = d(61801),
    color = hi.magenta,
    name = 'Jpeg',
  },
  ['jpg'] = {
    icon = d(61801),
    color = hi.magenta,
    name = 'Jpg',
  },
  ['js'] = {
    icon = d(61810),
    color = hi.yellow,
    name = 'Js',
  },
  ['json'] = {
    icon = d(61811),
    color = hi.one_bg3,
    name = 'Json',
  },
  ['jsx'] = {
    icon = d(61867),
    color = hi.nord_blue,
    name = 'Jsx',
  },
  ['license'] = {
    icon = d(61767),
    color = hi.yellow,
    name = 'License',
  },
  lua = {
    icon = d(61826),
    color = hi.nord_blue,
    name = 'Lua',
  },
  ['makefile'] = {
    icon = d(61911),
    color = hi.one_bg3,
    name = 'Makefile',
  },
  ['markdown'] = {
    icon = d(61829),
    color = hi.nord_blue,
    name = 'Markdown',
  },
  ['md'] = {
    icon = d(61829),
    color = hi.white,
    name = 'Md',
  },
  ['mdx'] = {
    icon = d(61829),
    color = hi.nord_blue,
    name = 'Mdx',
  },
  ['node_modules'] = {
    icon = d(61840),
    color = hi.baby_pink,
    name = 'NodeModules',
  },
  ['package.json'] = {
    icon = d(61843),
    color = hi.baby_pink,
    name = 'PackageJson',
  },
  ['package-lock.json'] = {
    icon = d(61843),
    color = hi.baby_pink,
    name = 'PackageLockJson',
  },
  ['php'] = {
    icon = d(61855),
    color = hi.magenta,
    name = 'Php',
  },
  ['pl'] = {
    icon = d(61853),
    color = hi.nord_blue,
    name = 'Pl',
  },
  ['png'] = {
    icon = d(61801),
    color = hi.magenta,
    name = 'Png',
  },
  ['py'] = {
    icon = d(61863),
    color = hi.sun,
    name = 'Py',
  },
  ['pyc'] = {
    icon = d(61863),
    color = hi.nord_blue,
    name = 'Pyc',
  },
  ['pyd'] = {
    icon = d(61863),
    color = hi.nord_blue,
    name = 'Pyd',
  },
  ['pyo'] = {
    icon = d(61863),
    color = hi.nord_blue,
    name = 'Pyo',
  },
  ['r'] = {
    icon = d(61866),
    color = hi.vibrant_green,
    name = 'R',
  },
  ['rake'] = {
    icon = d(61880),
    color = hi.baby_pink,
    name = 'Rake',
  },
  ['rakefile'] = {
    icon = d(61880),
    color = hi.baby_pink,
    name = 'Rakefile',
  },
  ['rb'] = {
    icon = d(61880),
    color = hi.baby_pink,
    name = 'Rb',
  },
  ['rs'] = {
    icon = d(61881),
    color = hi.one_bg3,
    name = 'Rs',
  },
  ['rss'] = {
    icon = d(61879),
    color = hi.orange,
    name = 'Rss',
  },
  ['scala'] = {
    icon = d(61882),
    color = hi.baby_pink,
    name = 'Scala',
  },
  ['sh'] = {
    icon = d(61911),
    color = hi.one_bg3,
    name = 'Sh',
  },
  ['sql'] = {
    icon = d(61746),
    color = hi.one_bg3,
    name = 'Sql',
  },
  ['swift'] = {
    icon = d(61906),
    color = hi.orange,
    name = 'Swift',
  },
  ['toml'] = {
    icon = d(61916),
    color = hi.one_bg3,
    name = 'Toml',
  },
  ['ts'] = {
    icon = d(61923),
    color = hi.nord_blue,
    name = 'Ts',
  },
  ['tsx'] = {
    icon = d(61867),
    color = hi.nord_blue,
    name = 'Tsx',
  },
  ['vim'] = {
    icon = d(61932),
    color = hi.vibrant_green,
    name = 'Vim',
  },
  ['vue'] = {
    icon = d(61940),
    color = hi.vibrant_green,
    name = 'Vue',
  },
  ['webp'] = {
    icon = d(61801),
    color = hi.magenta,
    name = 'Webp',
  },
  ['yaml'] = {
    icon = d(61945),
    color = hi.one_bg3,
    name = 'Yaml',
  },
  ['yml'] = {
    icon = d(61945),
    color = hi.one_bg3,
    name = 'Yml',
  },
  ['zsh'] = {
    icon = d(61911),
    color = hi.one_bg3,
    name = 'Zsh',
  },
  ['terminal'] = {
    icon = d(61911),
    color = hi.one_bg3,
    name = 'Terminal',
  },
  default_icon = { icon = '󰈚', name = 'Default' },
  deb = { icon = '', name = 'deb' },
  kt = { icon = '󱈙', name = 'kt' },
  lock = { icon = d(61823), name = 'lock' },
  mp3 = { icon = '󰎆', name = 'mp3' },
  mp4 = { icon = '', name = 'mp4' },
  out = { icon = '', name = 'out' },
  ['robots.txt'] = { icon = '󰚩', name = 'robots' },
  ttf = { icon = '', name = 'TrueTypeFont' },
  rpm = { icon = '', name = 'rpm' },
  woff = { icon = '', name = 'WebOpenFontFormat' },
  woff2 = { icon = '', name = 'WebOpenFontFormat2' },
  xz = { icon = '', name = 'xz' },
  zip = { icon = '', name = 'zip' },
  ['alert'] = { icon = d(61697), name = 'Alert' },
  ['angular'] = { icon = d(61698), name = 'Angular' },
  ['archive'] = { icon = d(61699) },
  ['arrow-both'] = { icon = d(61700) },
  ['arrow-down'] = { icon = d(61701) },
  ['arrow-left'] = { icon = d(61702) },
  ['arrow-right'] = { icon = d(61703) },
  ['arrow-switch'] = { icon = d(61704) },
  ['arrow-up'] = { icon = d(61705) },
  ['backbone'] = { icon = d(61706) },
  ['beaker'] = { icon = d(61707) },
  ['bell'] = { icon = d(61708) },
  ['bell-slash'] = { icon = d(61709) },
  ['bold'] = { icon = d(61710) },
  ['book'] = { icon = d(61711) },
  ['bookmark'] = { icon = d(61712) },
  ['bookmark-slash'] = { icon = d(61713) },
  ['briefcase'] = { icon = d(61714) },
  ['broadcast'] = { icon = d(61715) },
  ['browser'] = { icon = d(61716) },
  ['bug'] = { icon = d(61717) },
  ['c-plusplus'] = { icon = d(61719) },
  ['c-sharp'] = { icon = d(61720) },
  ['calendar'] = { icon = d(61721) },
  ['check'] = { icon = d(61722) },
  ['check-circle'] = { icon = d(61723) },
  ['check-circle-fill'] = { icon = d(61724) },
  ['checklist'] = { icon = d(61725) },
  ['chevron-down'] = { icon = d(61726) },
  ['chevron-left'] = { icon = d(61727) },
  ['chevron-right'] = { icon = d(61728) },
  ['chevron-up'] = { icon = d(61729) },
  ['circle'] = { icon = d(61730) },
  ['circle-slash'] = { icon = d(61731) },
  ['clippy'] = { icon = d(61732) },
  ['clock'] = { icon = d(61733) },
  ['code'] = { icon = d(61734) },
  ['code-review'] = { icon = d(61735) },
  ['code-square'] = { icon = d(61736) },
  ['comment'] = { icon = d(61737) },
  ['comment-discussion'] = { icon = d(61738) },
  ['container'] = { icon = d(61739) },
  ['cpu'] = { icon = d(61740) },
  ['credit-card'] = { icon = d(61741) },
  ['cross-reference'] = { icon = d(61742) },
  ['dash'] = { icon = d(61745) },
  ['database'] = { icon = d(61746) },
  ['desktop-download'] = { icon = d(61747) },
  ['device-camera'] = { icon = d(61748) },
  ['device-camera-video'] = { icon = d(61749) },
  ['device-desktop'] = { icon = d(61750) },
  ['device-mobile'] = { icon = d(61751) },
  ['diff'] = { icon = d(61752) },
  ['diff-added'] = { icon = d(61753) },
  ['diff-ignored'] = { icon = d(61754) },
  ['diff-modified'] = { icon = d(61755) },
  ['diff-removed'] = { icon = d(61756) },
  ['diff-renamed'] = { icon = d(61757) },
  ['docker'] = { icon = d(61758) },
  ['dot'] = { icon = d(61759) },
  ['dot-fill'] = { icon = d(61760) },
  ['download'] = { icon = d(61761) },
  ['ellipsis'] = { icon = d(61762) },
  ['elm'] = { icon = d(61763) },
  ['eye'] = { icon = d(61764) },
  ['eye-closed'] = { icon = d(61765) },
  ['file'] = { icon = d(61766) },
  ['file-badge'] = { icon = d(61767) },
  ['file-binary'] = { icon = d(61768) },
  ['file-code'] = { icon = d(61769) },
  ['file-diff'] = { icon = d(61770) },
  ['file-directory'] = { icon = d(61771) },
  ['file-directory-outline'] = { icon = d(61772) },
  ['file-submodule'] = { icon = d(61773) },
  ['file-symlink-file'] = { icon = d(61774) },
  ['file-zip'] = { icon = d(61775) },
  ['filter'] = { icon = d(61776) },
  ['flame'] = { icon = d(61777) },
  ['fold'] = { icon = d(61778) },
  ['fold-down'] = { icon = d(61779) },
  ['fold-up'] = { icon = d(61780) },
  ['gear'] = { icon = d(61781) },
  ['gift'] = { icon = d(61782) },
  ['git-branch'] = { icon = d(61783) },
  ['git-commit'] = { icon = d(61784) },
  ['git-compare'] = { icon = d(61785) },
  ['git-merge'] = { icon = d(61786) },
  ['git-pull-request'] = { icon = d(61787) },
  ['globe'] = { icon = d(61788) },
  ['grabber'] = { icon = d(61790) },
  ['graph'] = { icon = d(61791) },
  ['heading'] = { icon = d(61792) },
  ['heart'] = { icon = d(61793) },
  ['heart-fill'] = { icon = d(61794) },
  ['history'] = { icon = d(61795) },
  ['home'] = { icon = d(61796) },
  ['horizontal-rule'] = { icon = d(61797) },
  ['hourglass'] = { icon = d(61798) },
  ['hubot'] = { icon = d(61800) },
  ['image'] = { icon = d(61801) },
  ['inbox'] = { icon = d(61802) },
  ['infinity'] = { icon = d(61803) },
  ['info'] = { icon = d(61804) },
  ['issue-closed'] = { icon = d(61805) },
  ['issue-opened'] = { icon = d(61806) },
  ['issue-reopened'] = { icon = d(61807) },
  ['italic'] = { icon = d(61808) },
  ['javascript'] = { icon = d(61810) },
  ['kebab-horizontal'] = { icon = d(61812) },
  ['key'] = { icon = d(61813) },
  ['kotlin'] = { icon = d(61814) },
  ['kubernetes'] = { icon = d(61815) },
  ['law'] = { icon = d(61816) },
  ['light-bulb'] = { icon = d(61817) },
  ['link'] = { icon = d(61818) },
  ['link-external'] = { icon = d(61819) },
  ['list-ordered'] = { icon = d(61820) },
  ['list-unordered'] = { icon = d(61821) },
  ['location'] = { icon = d(61822) },
  ['logo-gist'] = { icon = d(61824) },
  ['logo-github'] = { icon = d(61825) },
  ['mail'] = { icon = d(61827) },
  ['mark-github'] = { icon = d(61828) },
  ['megaphone'] = { icon = d(61830) },
  ['mention'] = { icon = d(61831) },
  ['meter'] = { icon = d(61832) },
  ['milestone'] = { icon = d(61833) },
  ['mirror'] = { icon = d(61834) },
  ['moon'] = { icon = d(61835) },
  ['mortar-board'] = { icon = d(61836) },
  ['mute'] = { icon = d(61837) },
  ['nginx'] = { icon = d(61838) },
  ['no-entry'] = { icon = d(61839) },
  ['node'] = { icon = d(61840) },
  ['north-star'] = { icon = d(61841) },
  ['note'] = { icon = d(61842) },
  ['npm'] = { icon = d(61843) },
  ['octoface'] = { icon = d(61844) },
  ['organization'] = { icon = d(61845) },
  ['package'] = { icon = d(61846) },
  ['package-dependencies'] = { icon = d(61847) },
  ['package-dependents'] = { icon = d(61848) },
  ['paintbrush'] = { icon = d(61849) },
  ['paper-airplane'] = { icon = d(61850) },
  ['pencil'] = { icon = d(61851) },
  ['people'] = { icon = d(61852) },
  ['perl'] = { icon = d(61853) },
  ['person'] = { icon = d(61854) },
  ['pin'] = { icon = d(61856) },
  ['play'] = { icon = d(61857) },
  ['plug'] = { icon = d(61858) },
  ['plus'] = { icon = d(61859) },
  ['plus-circle'] = { icon = d(61860) },
  ['project'] = { icon = d(61861) },
  ['pulse'] = { icon = d(61862) },
  ['python'] = { icon = d(61863) },
  ['question'] = { icon = d(61864) },
  ['quote'] = { icon = d(61865) },
  ['react'] = { icon = d(61867) },
  ['rectangle'] = { icon = d(61868) },
  ['reply'] = { icon = d(61869) },
  ['repo'] = { icon = d(61870) },
  ['repo-clone'] = { icon = d(61871) },
  ['repo-forked'] = { icon = d(61872) },
  ['repo-pull'] = { icon = d(61873) },
  ['repo-push'] = { icon = d(61874) },
  ['repo-template'] = { icon = d(61875) },
  ['report'] = { icon = d(61876) },
  ['require'] = { icon = d(61877) },
  ['rocket'] = { icon = d(61878) },
  ['ruby'] = { icon = d(61880) },
  ['rust'] = { icon = d(61881) },
  ['screen-full'] = { icon = d(61883) },
  ['screen-normal'] = { icon = d(61884) },
  ['search'] = { icon = d(61885) },
  ['server'] = { icon = d(61886) },
  ['share'] = { icon = d(61887) },
  ['share-android'] = { icon = d(61888) },
  ['shield'] = { icon = d(61889) },
  ['shield-check'] = { icon = d(61890) },
  ['shield-lock'] = { icon = d(61891) },
  ['shield-x'] = { icon = d(61892) },
  ['sign-in'] = { icon = d(61893) },
  ['sign-out'] = { icon = d(61894) },
  ['skip'] = { icon = d(61895) },
  ['smiley'] = { icon = d(61896) },
  ['square'] = { icon = d(61897) },
  ['square-fill'] = { icon = d(61898) },
  ['squirrel'] = { icon = d(61899) },
  ['star'] = { icon = d(61900) },
  ['star-fill'] = { icon = d(61901) },
  ['stop'] = { icon = d(61902) },
  ['stopwatch'] = { icon = d(61903) },
  ['strikethrough'] = { icon = d(61904) },
  ['sun'] = { icon = d(61905) },
  ['sync'] = { icon = d(61907) },
  ['tag'] = { icon = d(61908) },
  ['tasklist'] = { icon = d(61909) },
  ['telescope'] = { icon = d(61910) },
  ['three-bars'] = { icon = d(61912) },
  ['thumbsdown'] = { icon = d(61913) },
  ['thumbsup'] = { icon = d(61914) },
  ['tmux'] = { icon = d(61915) },
  ['tools'] = { icon = d(61917) },
  ['trashcan'] = { icon = d(61918) },
  ['triangle-down'] = { icon = d(61919) },
  ['triangle-left'] = { icon = d(61920) },
  ['triangle-right'] = { icon = d(61921) },
  ['triangle-up'] = { icon = d(61922) },
  ['typescript'] = { icon = d(61923) },
  ['typography'] = { icon = d(61924) },
  ['unfold'] = { icon = d(61925) },
  ['unlock'] = { icon = d(61926) },
  ['unmute'] = { icon = d(61927) },
  ['unverified'] = { icon = d(61928) },
  ['upload'] = { icon = d(61929) },
  ['verified'] = { icon = d(61930) },
  ['versions'] = { icon = d(61931) },
  ['vim-command-mode'] = { icon = d(61933) },
  ['vim-insert-mode'] = { icon = d(61934) },
  ['vim-normal-mode'] = { icon = d(61935) },
  ['vim-replace-mode'] = { icon = d(61936) },
  ['vim-select-mode'] = { icon = d(61937) },
  ['vim-terminal-mode'] = { icon = d(61938) },
  ['vim-visual-mode'] = { icon = d(61939) },
  ['workflow'] = { icon = d(61941) },
  ['x'] = { icon = d(61942) },
  ['x-circle'] = { icon = d(61943) },
  ['x-circle-fill'] = { icon = d(61944) },
  ['yarn'] = { icon = d(61946) },
  ['zap'] = { icon = d(61947) },
  ['multi-select'] = { icon = d(61948) },
  ['number'] = { icon = d(61949) },
  ['trash'] = { icon = d(61950) },
  ['video'] = { icon = d(61951) },
  ['class'] = { icon = d(61952) },
  ['constant'] = { icon = d(61953) },
  ['field'] = { icon = d(61954) },
  ['interface'] = { icon = d(61955) },
  ['keyword'] = { icon = d(61956) },
  ['snippet'] = { icon = d(61957) },
  ['struct'] = { icon = d(61958) },
  ['type'] = { icon = d(61959) },
  ['variable'] = { icon = d(61960) },
  ['blocked'] = { icon = d(61961) },
  ['codescan'] = { icon = d(61962) },
  ['codescan-checkmark'] = { icon = d(61963) },
  ['codespaces'] = { icon = d(61964) },
  ['dependabot'] = { icon = d(61965) },
  ['duplicate'] = { icon = d(61966) },
  ['person-add'] = { icon = d(61967) },
  ['sidebar-collapse'] = { icon = d(61968) },
  ['sidebar-expand'] = { icon = d(61969) },
  ['table'] = { icon = d(61970) },
  ['elixir'] = { icon = d(61971) },
  ['terraform'] = { icon = d(61972) },
  ['columns'] = { icon = d(61973) },
  ['diamond'] = { icon = d(61974) },
  ['git-pull-request-closed'] = { icon = d(61975) },
  ['git-pull-request-draft'] = { icon = d(61976) },
  ['hash'] = { icon = d(61977) },
  ['issue-draft'] = { icon = d(61978) },
  ['rows'] = { icon = d(61979) },
  ['select-single'] = { icon = d(61980) },
  ['eslint'] = { icon = d(61981) },
  ['prettier'] = { icon = d(61982) },
  ['vscode'] = { icon = d(61983) },
  ['copy'] = { icon = d(61984) },
  ['key-asterisk'] = { icon = d(61985) },
  ['paste'] = { icon = d(61986) },
  ['sort-asc'] = { icon = d(61987) },
  ['sort-desc'] = { icon = d(61988) },
  ['babel'] = { icon = d(61989) },
  ['ionic'] = { icon = d(61990) },
  ['next'] = { icon = d(61991) },
  ['svelte'] = { icon = d(61992) },
  ['capacitor'] = { icon = d(61993) },
  ['graphql'] = { icon = d(61994) },
  ['accessibility'] = { icon = d(61995) },
  ['apps'] = { icon = d(61996) },
  ['bell-fill'] = { icon = d(61997) },
  ['cloud'] = { icon = d(61998) },
  ['cloud-offline'] = { icon = d(61999) },
  ['code-of-conduct'] = { icon = d(62000) },
  ['feed-discussion'] = { icon = d(62001) },
  ['feed-forked'] = { icon = d(62002) },
  ['feed-heart'] = { icon = d(62003) },
  ['feed-merged'] = { icon = d(62004) },
  ['feed-person'] = { icon = d(62005) },
  ['feed-repo'] = { icon = d(62006) },
  ['feed-rocket'] = { icon = d(62007) },
  ['feed-star'] = { icon = d(62008) },
  ['feed-tag'] = { icon = d(62009) },
  ['feed-trophy'] = { icon = d(62010) },
  ['file-directory-fill'] = { icon = d(62011) },
  ['file-directory-open-fill'] = { icon = d(62012) },
  ['id-badge'] = { icon = d(62013) },
  ['iterations'] = { icon = d(62014) },
  ['log'] = { icon = d(62015) },
  ['person-fill'] = { icon = d(62016), name = 'Person-fill' },
  ['repo-deleted'] = { icon = d(62017), name = 'Repo-deleted' },
  ['repo-locked'] = { icon = d(62018), name = 'Repo-locked' },
  ['single-select'] = { icon = d(62019), name = 'Single-select' },
  ['sliders'] = { icon = d(62020), name = 'Sliders' },
  ['stack'] = { icon = d(62021), name = 'Stack' },
  ['tab-external'] = { icon = d(62022), name = 'Tab-external' },
  ['telescope-fill'] = { icon = d(62023), name = 'Telescope-fill' },
  ['trophy'] = { icon = d(62024), name = 'Trophy' },
  ['webhook'] = { icon = d(62025), name = 'Webhook' },
}
