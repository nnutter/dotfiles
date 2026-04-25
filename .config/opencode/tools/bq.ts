import { tool } from "@opencode-ai/plugin"

export const list_datasets = tool({
  description: "List datasets in project",
  args: {
    project_id: tool.schema.string().describe("project_id"),
  },
  async execute(args, context) {
    const result = await Bun.$`bq ls --format=json ${args.project_id}`.text()
    return result.trim()
  },
})

export const list_tables = tool({
  description: "List tables in a dataset",
  args: {
    project_id: tool.schema.string().describe("project_id"),
    dataset_id: tool.schema.string().describe("dataset_id"),
  },
  async execute(args, context) {
    const result = await Bun.$`bq ls --format=json ${args.project_id}:${args.dataset_id}`.text()
    return result.trim()
  },
})

export const get_table_schema = tool({
  description: "Get table schema",
  args: {
    project_id: tool.schema.string().describe("project_id"),
    dataset_id: tool.schema.string().describe("dataset_id"),
    table_id: tool.schema.string().describe("table_id"),
  },
  async execute(args, context) {
    const result = await Bun.$`bq show --schema --format=json ${args.project_id}:${args.dataset_id}.${args.table_id}`.text()
    return result.trim()
  },
})
