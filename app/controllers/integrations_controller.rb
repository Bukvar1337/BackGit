class IntegrationsController < ApplicationController
  before_action :get_auth, only: [:get_departments, :get_users, :get_projects]
  def get_departments
    url = 'https://admin.staging.shr.phoenixit.ru/api/v0/departments'

    resp = Faraday.get(url) do |req|
      req.options.timeout = 20
      req.headers = @headers
    end

    @result = JSON.parse(resp.body)

    @result.each do |result|
     data_hash = {uuid: result["id"], parent_uuid: result["parent_id"],
                  name: result["name_ru"]}
      if Department.where(["uuid LIKE ?", "%#{result["id"].to_s}%"]).exists?
        @department = Department.where(["uuid LIKE ?", "%#{result["id"].to_s}%"]).first
        @department.update(data_hash)
      else
        @department = Department.new(data_hash)
        @department.save!
      end
     end

    render json: Department.all.to_json
  end

  def get_users
    url = 'https://admin.staging.shr.phoenixit.ru/api/v0/accounts/profile_info'

     resp = Faraday.get(url) do |req|
         req.options.timeout = 20
         req.headers = @headers
      end
     @result = JSON.parse(resp.body)["accounts"]
     @result.each do |result|
          unless result["department"].nil?
       department_id = Department.where(["uuid LIKE ?",
                                          "%#{result["department"]["id"].to_s}%"]).first.id
        end
     data_hash = {uuid: result["id"], parent_uuid: result["manager_id"],
        first_name: result["name"], middle_name: result["middlename"],
         last_name: result["surname"], job_position: result["position"],
                 department_id: department_id}
     if User.where(["uuid LIKE ?", "%#{result["id"].to_s}%"]).exists?
      @user = User.where(["uuid LIKE ?", "%#{result["id"].to_s}%"]).first
      @user.update(data_hash)
     else
    @user = User.new(data_hash)
    @user.save!
      end
    end
    User.all.each do |user|
      unless user.parent_uuid.nil?
      parent_id = User.where(["uuid LIKE ?", "%#{user.parent_uuid}%"]).first.id
      user.update(parent_id: parent_id)
    end
    end
    render json: User.all.as_json
  end

  def get_projects
    url = 'https://admin.staging.shr.phoenixit.ru/api/v0/projects/dictionary'

    resp = Faraday.get(url) do |req|
      req.options.timeout = 20
      req.headers = @headers
    end
    @result = JSON.parse(resp.body)
    #@result.each do |result|
    # @department = Department.new(parent_uuid: result["id"], uuid: result["parent_id"])
    #@department.save
    #end
    render json: @result.as_json
  end

  private def get_auth
    auth_url = 'https://admin.staging.shr.phoenixit.ru/api/v0/auth/sign_in'
    auth_resp = Faraday.post(auth_url, '{"email": "jphoenix@phoenixit.ru","password": "t3naUisqOpcbA4"}',
                             "Content-Type" => "application/json")
    @headers ={
        'Access-Token': auth_resp.headers['access-token'],
        'Client': auth_resp.headers['client'],
        'Uid': auth_resp.headers['uid']
    }
  end
end
#@result.each do |result|
  #if Department.where(["uuid LIKE ?", "%#{result["id"].to_s}%"]).exists?
  #  @department = Department.new(parent_uuid: result["id"], uuid: result["parent_id"])
  # @department.save
  #  else
  #  @department = Department.where(["uuid LIKE ?", "%#{result["id"].to_s}%"]).first
  #   @department.update(parent_uuid: result["id"], uuid: result["parent_id"])
#end