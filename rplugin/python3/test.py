import pynvim

@pynvim.plugin
class TestPlugin(object):

    def __init__(self, nvim):
        self.nvim = nvim

    @pynvim.function('TestFunction', sync=True)
    def testfunction(self, args):
        return 3

    @pynvim.command('TestAbcd', nargs='*', range='')
    def abc(self, args, range):
        self.nvim.current.line=str(self.nvim.api.win_get_number(0))
        self.nvim.api.open_win(0,False,{'relative':'win','width':12,'height':3,'bufpos':[100,10]})    
        #self.nvim.current.window.close(True)
    @pynvim.autocmd('BufEnter', pattern='*.py', eval='expand("<afile>")', sync=True)
    def on_bufenter(self, filename):
        self.nvim.out_write('testplugin is in ' + filename + '\n')
