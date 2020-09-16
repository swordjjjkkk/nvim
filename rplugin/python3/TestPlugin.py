
import pynvim



@pynvim.plugin
class TestPlugin(object):

    def __init__(self, nvim):
        self.nvim = nvim
        self.bid=-1

    @pynvim.function('TestFunction', sync=True)
    def testfunction(self, args):
        return 3

    @pynvim.command('TestCommand', nargs='*', range='')
    def testcommand(self, args, range):
        self.winview=self.nvim.funcs.winsaveview()
        #self.nvim.current.buffer.append(str(self.nvim.funcs.bufnr('')))



    @pynvim.command('TestCommand2', nargs='*', range='')
    def testcommand2(self, args, range):
        self.nvim.funcs.winrestview(self.winview)
        #self.nvim.current.buffer.append(str(self.nvim.funcs.bufnr('')))



    @pynvim.command('TerminalToggle', nargs='*', range='')
    def TerminalToggle(self, args, range):
        #self.nvim.current.buffer.append(sys.executable)
        
        if self.bid==-1:
            wininfo=self.nvim.funcs.getwininfo()
            biggestwin=wininfo[0]['winid']
            maxarea=wininfo[0]['width']*wininfo[0]['height']
            maxheight=wininfo[0]['height']


            for i in wininfo:
                #self.nvim.current.buffer.append(str(i['width']))
                area=i['width']*i['height']
                if area>maxarea:
                    maxarea=area
                    biggestwin=i['winid']
                    maxheight=i['height']
           

            self.nvim.funcs.win_gotoid(biggestwin)
            self.nvim.funcs.execute(':bel '+str(maxheight/4)+' split')
            self.nvim.funcs.execute(':terminal')
            self.bid=self.nvim.funcs.bufnr('')
        else:
            winid=self.nvim.funcs.bufwinid(self.bid)
            if winid==-1:
                return
            

            if winid!=self.nvim.funcs.win_getid():
                uid=self.nvim.funcs.win_getid()
                self.nvim.funcs.win_gotoid(winid)
                self.nvim.funcs.execute(':q')
                self.nvim.funcs.win_gotoid(uid)
            else:
                self.nvim.funcs.execute(':q')

            
            self.bid=-1
                
            #self.nvim.current.line =str(wininfo[0]['width'])
     
        
        

    @pynvim.autocmd('BufEnter', pattern='*.py', eval='expand("<afile>")', sync=True)
    def on_bufenter(self, filename):
        self.nvim.out_write('testplugin is in ' + filename + '\n')


