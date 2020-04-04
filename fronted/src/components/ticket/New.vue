<template>
  <div class="container">
    <div class="select-workflow-con">
      <Card style="text-align: left;">
        <template slot="title"><span style="font-weight: 700;">选择业务</span></template>
        <Select v-model="workflow" size="large" label-in-value @on-change="handleWorkflow" style="width: 400px;">
          <Option v-for="(item, index) in workflows" :key="index" :value="item.id">{{item.name}}</Option>
        </Select>
      </Card>
    </div>
    <div class="new-form-con" v-if="workflow">
      <Card style="text-align: left;">
        <template slot="title" v-cloak><span style="font-weight: 700;">{{ workflowTitle }}</span></template>
        <div class="form" v-if="!fieldEmpty">
          <Form ref="newForm" :model="newForm" :rules="newFormRules" :label-width="150">
            <Row>
              <Col :md="{span: item.field_type_id === 55 ? 22 : 11}" v-for="(item, index) in init_state.field_list" :key="index">
                <FormItem :label="item.name || item.field_name" :prop="item.field_key">
                  <Input v-if="item.field_type_id === 5" v-model="newForm[item.field_key]" :placeholder="$t(`field_label.${item.field_key}`)"></Input>
                  <InputNumber v-if="item.field_type_id === 15" v-model="newForm[item.field_key]" :min="0" :step="0.5" style="width: 100%;"></InputNumber>
                  <DatePicker v-if="item.field_type_id === 30" v-model="newForm[item.field_key]" type="datetime" format="yyyy-MM-dd HH:mm:ss" style="width: 100%;" :placeholder="$t(`field_label.${item.field_key}`)"></DatePicker>
                  <!-- TODO: ElementUI/iView对于动态v-model都有BUG，改用单选菜单方式 -->
                  <!-- <el-radio-group v-if="item.field_type_id === 35" v-model="newForm[item.field_key]">
                    <el-radio v-for="(choice, i) in Object.keys(item.field_choice)" :key="i" :label="choice">{{item.field_choice[choice]}}</el-radio>
                  </el-radio-group> -->
                  <!-- <RadioGroup v-if="item.field_type_id === 35" v-model="newForm[item.field_key]">
                    <Radio v-for="(choice, i) in Object.keys(item.field_choice)" :key="i" :label="choice">{{item.field_choice[choice]}}</Radio>
                  </RadioGroup> -->
                  <Select v-if="item.field_type_id === 40" v-model="newForm[item.field_key]" multiple :placeholder="$t(`field_label.${item.field_key}`)">
                    <Option v-for="(choice, i) in Object.keys(item.field_choice)" :key="i" :value="choice">{{item.field_choice[choice]}}</Option>
                  </Select>
                  <Select v-if="item.field_type_id === 45 || item.field_type_id === 35" v-model="newForm[item.field_key]" :placeholder="$t(`field_label.${item.field_key}`)">
                    <Option v-for="(choice, i) in Object.keys(item.field_choice)" :key="i" :value="choice">{{item.field_choice[choice]}}</Option>
                  </Select>
                  <!-- <tinymce v-if="item.field_type_id === 55" v-model="newForm[item.field_key]" :id="item.field_key" :other_option="tinymceOptions"></tinymce> -->
                  <ueditor v-if="item.field_type_id === 55" ueditorConfig="ueditorConfig" @ready="handleReady"></ueditor>
                  <Select v-if="item.field_type_id === 60" v-model="newForm[item.field_key]" :placeholder="$t(`field_label.${item.field_key}`)">
                    <Option v-for="(user, index) in accountList" :key="index" :value="user.username">{{user.alias}}</Option>
                  </Select>
                  <Select v-if="item.field_type_id === 70" v-model="newForm[item.field_key]" multiple :placeholder="$t(`field_label.${item.field_key}`)">
                    <Option v-for="(user, index) in accountList" :key="index" :value="user.username">{{user.alias}}</Option>
                  </Select>
                </FormItem>
              </Col>
            </Row>
            <FormItem style="text-align: center;">
              <Button v-for="(btn, b) in init_state.transition" :key="b" @click="handleButton('newForm', btn.transition_id)" :type="btn.transition_id === 1 ? 'primary' : 'info'" style="margin: 0 5px;">{{btn.transition_name}}</Button>
              <Button type="warning" style="margin: 0 5px;" @click="reset('newForm')">重置</Button>
            </FormItem>
          </Form>
        </div>
        <div class="form" v-else>
          <span>业务流程未初始化配置</span>
        </div>
      </Card>
    </div>
    <Spin fix v-if="loading">
      <Icon type="load-c" size=50 class="demo-spin-icon-load"></Icon>
      <div style="font-size: 28px;">loading...</div>
    </Spin>
  </div>
</template>

<script>
import Validators from '../../utils/validators'
import {Date} from '../../utils/datetime'
import ueditor from './components/ueditor'

export default {
  name: 'new',
  components: {
    ueditor
  },
  data () {
    return {
      loading: false,
      workflows: [],
      accountList: [],
      workflow: null,
      init_state: {},
      workflowTitle: '',
      ueditorConfig: {}
    }
  },
  methods: {
    init () {
      this.loading = true
      this.$store.dispatch('api_workflows').then(resp => {
        if (resp.data.code === -1) {
          alert(resp.data.msg)
        }
        this.workflows = resp.data.data.value
        this.loading = false
      })
    },
    handleWorkflow (workflow) {
      this.workflowTitle = workflow.label
      this.workflow = workflow.value
      this.loading = true
      this.$store.dispatch('api_init_state', {id: workflow.value}).then(resp => {
        this.init_state = resp.data.data;
        if (resp.data.code === -1){
          alert(resp.data.msg);
        }
        if (this.init_state.field_list) {
          this.$store.dispatch('api_fetch_account_list').then(resp => {
            this.accountList = resp.data.data
            this.loading = false
          })
        }
        this.loading = false
      })
    },
    handleButton (formName, id) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          var data = {
            workflow_id: this.workflow,
            transition_id: id
          }
          Object.assign(data, this.newForm)
          for (let i = 0; i < Object.keys(this.init_state.field_list).length; i++) {
            if ([25, 30].includes(this.init_state.field_list[i].field_type_id)) {
              data[this.init_state.field_list[i].field_key] = data[this.init_state.field_list[i].field_key].format("yyyy-MM-dd hh:mm:ss")
            }
            if ([70].includes(this.init_state.field_list[i].field_type_id)) {
              data[this.init_state.field_list[i].field_key] = data[this.init_state.field_list[i].field_key].join(',')
            }
          }
          this.$store.dispatch('api_post_ticket', data).then(resp => {
            this.$Notice.success({title: '创建成功'})
            this.$router.push({name: 'myself'})
          }).catch(error => {
            this.$Notice.error({title: '创建失败'})
          })
        } else {
          return false
        }
      })
    },
    handleReady (instance) {
      instance.setContent('')
      instance.addListener('contentChange', () => {
        for (let i = 0; i < this.init_state.field_list.length; i++) {
          if (this.init_state.field_list[i].field_type_id === 55) {
            this.newForm[this.init_state.field_list[i].field_key] = instance.getContent()
          }
        }
      })
    },
    reset (formName) {
      this.$refs[formName].resetFields()
    }
  },
  computed: {
    fieldEmpty () {
      for (let i in this.init_state.field_list) {
        return false
      }
      return true
    },
    newFormRules () {
      let validators = {}
      this.init_state.field_list.map(item => {
        if (item.field_attribute === 2) {
          if ([5, 35, 45, 55, 60].includes(item.field_type_id)) {
            validators[item.field_key] = [{validator: Validators.string, type: 'string', trigger: 'blur'}]
          } else if ([25, 30].includes(item.field_type_id)) {
            validators[item.field_key] = [{validator: Validators.datetime, type: 'date', trigger: 'blur'}]
          } else if ([40, 50, 70].includes(item.field_type_id)) {
            validators[item.field_key] = [{required: true, type: 'array', trigger: 'blur'}]
          } else if ([10, 15].includes(item.field_type_id)) {
            validators[item.field_key] = [{validator: Validators.number, type: 'number', trigger: 'blur'}]
          } else if (item.field_type_id === 20) {
            validators[item.field_type_id] = [{required: true, type: 'boolean', trigger: 'blur'}]
          }
        }
      })
      return validators
    },
    newForm () {
      let form = {}
      for (let i = 0; i < this.init_state.field_list.length; i++) {
        if ([40, 50, 70].includes(this.init_state.field_list[i].field_type_id)) {
          form[this.init_state.field_list[i].field_key] = []
        } else if ([10, 15].includes(this.init_state.field_list[i].field_type_id)) {
          form[this.init_state.field_list[i].field_key] = 0
        } else {
          form[this.init_state.field_list[i].field_key] = ''
        }
      }
      return form
    }
  },
  created () {
    this.init()
  }
}
</script>

<style lang="less" scoped>
.new-form-con {
  margin-top: 15px;
}
</style>
