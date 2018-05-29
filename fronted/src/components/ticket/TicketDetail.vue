<template>
  <div class="container">
    <!-- 流程图 -->
    <Row :gutter="10">
      <Col :md="{span: 24}">
        <Card style="text-align: left;">
          <template slot="title">
            <span style="font-weight: 700;">
              <Icon type="map"></Icon>
              <span>流程图</span>
            </span>
          </template>
          <Steps :current="currentStep">
            <Step v-for="(step, index) in steps" :key="index" :title="step.state_name"></Step>
          </Steps>
        </Card>
      </Col>
    </Row>
    <!-- 详情与操作 -->
    <Row :gutter="1" style="text-align: left; margin: 5px 0;">
      <Col :md="{span: 18}">
        <Card id="ticket-detail">
          <template slot="title">
            <span style="font-weight: 700;">
              <Icon type="android-clipboard"></Icon> 
              <span>{{workflow.description}} 详情</span>
            </span>
          </template>
          <Row>
            <Form :label-width="150">
              <Col v-for="(field, index) in ticket.field_list" :key="index" :md="{span: field.field_type_id === 55 ? 24 : 12}">
                <FormItem v-if="field.field_type_id === 35" :label="field.name || field.field_name">
                  <span>{{choiceFieldDisplay}}</span>
                </FormItem>
                <FormItem v-else-if="field.field_type_id === 55" :label="field.name || field.field_name">
                  <div class="tinymce" v-html="field.value || field.field_value"></div>
                </FormItem>
                <FormItem v-else :label="field.name || field.field_name">
                  <span>{{field.value || field.field_value}}</span>
                </FormItem>
              </Col>
            </Form>
          </Row>
        </Card>
      </Col>
      <Col :md="{span: 6}">
        <Card :style="{height: cardHeight}">
          <template slot="title">
            <span style="font-weight: 700;">
              <Icon type="ionic"></Icon>
              <span>流转操作</span>
            </span>
          </template>
          {{ticket.state_id}} <br>
          {{stepTransition}}
          <Form>
            <template></template>
          </Form>
        </Card>
      </Col>
    </Row>
    <!-- 日志 -->
    <Row :gutter="10">
      <Col :md="{span: 24}">
        <Card style="text-align: left;">
          <template slot="title">
            <span style="font-weight: 700;">
              <Icon type="clipboard"></Icon>
              <span>工单操作日志</span>
            </span>
          </template>
          <Table :columns="logtable.columns" :data="logtable.data"></Table>
        </Card>
      </Col>
    </Row>

    <Row style="text-align: left; margin: 5px 0;">
      <Col>
        <Card>
          <template slot="title">
            <span style="font-weight: 700;">Debug</span>
          </template>
          <span style="color: red; font-weight: 700;">Steps </span>{{steps}}
          <hr>
          <span style="color: red; font-weight: 700;">Ticket </span>{{ticket}}
        </Card>
      </Col>
    </Row>
  </div>
</template>

<script>
import Utils from '../../utils'
export default {
  name: 'ticket-detail',
  data () {
    return {
      ticket: {},
      workflow: {},
      logtable: {
        columns: [
          {
            key: 'state',
            title: '节点名称',
            align: 'center',
            render: (h, params) => {
              return h('div', [
                h('span', {}, params.row.state.state_name)
              ])
            }
          },
          {
            key: 'participant',
            title: '参与者',
            align: 'center',
          },
          {
            key: 'gmt_created',
            title: '操作时间',
            align: 'center',
          },
          {
            key: 'suggestion',
            title: '处理意见',
            align: 'center',
            render: (h, params) => {
              return h('div', [
                h('span', {}, params.row.state.suggestion ? params.row.state.suggestion : '——')
              ])
            }
          }
        ],
        data: []
      },
      steps: [],
      currentStep: 1,
      cardHeight: '',
      stepTransition: {}
    }
  },
  methods: {
    init () {
      this.$store.dispatch('api_get_ticket_detail', {id: this.ticket_id, username: 'admin'}).then(resp => {
        this.ticket = resp.data.data.value
        const workflow_id = this.ticket.workflow_id
        this.$store.dispatch('api_workflows').then(resp => {
          let workflows = resp.data.data.value
          this.workflow = workflows.filter(item => {
            if (item.id === workflow_id) {
              return true
            }
          })[0]
        })
        this.$store.dispatch('api_get_ticket_transiton_list', this.ticket.id).then(resp => {
          this.logtable.data = resp.data.data.value
        })
        this.$store.dispatch('api_get_ticket_step_list', this.ticket.id).then(resp => {
          this.steps = resp.data.data.value
        })
      }).catch(error => {
        this.$Notice.error({title: '接口错误或数据不存在！'})
      })
    }
  },
  computed: {
    ticket_id () {
      return this.$route.params.id
    },
    choiceFieldDisplay () {
      let result
      this.ticket.field_list.filter(item => {
        if (item.field_type_id === 35) {
          let keys = Object.keys(item.field_choice)
          for (let i = 0; i < keys.length; i++) {
            if (item.value === keys[i] || item.field_value === keys[i]) {
              result = item.field_choice[keys[i]]
            }
          }
          if (!result) {
            result = '——'
          }
        }
      })
      return result
    },
  },
  watch: {
    steps () {
      if (this.steps[0] && this.steps[0].id) {
        this.currentStep = this.ticket.state_id - this.steps[0].id
        this.steps.filter(item => {
          if (item.state_id === (this.ticket.state_id - 1)) {
            this.stepTransition = item
          }
        })
        console.log(this.stepTransition)
      }
    }
  },
  mounted () {
    this.init()
    setTimeout(() => {
      let dom = document.getElementById('ticket-detail')
      this.cardHeight = dom.offsetHeight + 'px'
    }, 500)
  }
}
</script>

<style scoped>
.ivu-form {
  font-size: 15px;
}
.ivu-form-item {
  margin-bottom: 10px;
}
</style>
