# AI 应用云原生最佳实践

这个案例包含了 [训练任务](train.py) 和 [推理服务](api.py) 两个应用。

对于 AI 应用开发者来说，操作流程如下：

1. 写业务逻辑 code: train.py + api.py
1. 写一个简单的 app.yaml，加上在 UI 配置下 git repo
1. git push，触发一系列 render & build & deploy 操作
1. 最后训练完成、推理上线
1. 在 UI 上也可以看到生成的配置、CI/CD pipeline、训练任务、推理服务等

注意这个例子里的下列配置跟业务代码无关，属于 render 操作生成的内容，放在这里作为示例:

- Dockerfiles/
- kubernetes/
- `.github/workflows/{ci,cd}.yaml`
- `.nocalhost/`
